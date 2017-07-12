set :repo_url,        'git@github.com:liveanimations/Norma4D.git'
set :application,     'Norma4D'
set :user,            'deployer'
set :puma_threads,    [1, 1]
set :puma_workers,    8
set :rvm_roles,       [:app] # to skip the check at india vps server

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs,  %w{log geo tmp/pids tmp/cache tmp/sockets vendor/bundle public/files public/certificates}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  namespace :nginx do
    desc 'Update nginx configuration'
    task :update_config do
      on roles(:web) do
        within release_path do
          sudo :cp, '-f', 'config/nginx.conf', '/etc/nginx/nginx.conf'
          puts capture('sudo nginx -t')
          sudo :kill, '-s HUP `cat /run/nginx.pid`'
        end
      end
    end

    desc 'Update nginx config at India VPS'
    task :update_india_config do
      on roles(:proxy) do
        upload! StringIO.new(File.read('config/nginx.india.conf')), '/tmp/nginx.conf' # NB this uploads your local file! not form git repo
        execute :cp, '-f', '/tmp/nginx.conf', '/etc/nginx/nginx.conf'
        puts capture('nginx -t')
        execute :kill, '-s HUP `cat /run/nginx.pid`'
      end
    end
  end

  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  task :upload_yml do
    on roles(:app) do
      execute "mkdir #{shared_path}/config -p"
      upload! StringIO.new(File.read('config/database.yml')), "#{shared_path}/config/database.yml"
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'upload_yml'
      invoke 'deploy'
    end
  end

  before :starting,     :check_revision
  after 'deploy:updated', 'deploy:nginx:update_config'
  after 'deploy:updated', 'deploy:nginx:update_india_config'
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
end
