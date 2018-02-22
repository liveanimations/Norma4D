source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.6'
gem 'jbuilder', '~> 2.0'
gem 'therubyracer', platforms: :ruby
gem 'pg'

gem 'devise'

# Frontend
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bootstrap-sass'
gem 'bootstrap-wysihtml5-rails'
gem 'haml'
gem 'responders'
gem 'simple_form'
gem 'jquery-rails'


# Attachments
gem 'rmagick'
gem 'paperclip', '~> 4.3.7'

# Mobile app notifications
gem 'houston'
gem 'gcm'

gem 'cancancan'
gem 'postmark-rails'
gem 'iso-639'
gem 'rubyzip'
gem 'maxminddb'

# Background processing
gem 'sidekiq'
gem 'sinatra', require: false # for 'sidekiq/web'
gem 'whenever'

group :development do
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'web-console', '~> 2.0'
end

gem 'puma'

gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'pry-rails'
  gem 'pry-nav', require: false
  gem 'byebug'
  gem 'webmock'
  gem 'mocha'
  gem 'minitest-reporters'
  gem 'minitest-stub-const'
  gem 'minitest-rails-capybara'
end

gem 'rails_12factor', group: :production
