source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby

gem 'devise'
gem 'bootstrap-sass'
gem 'bootstrap-wysihtml5-rails'
gem 'haml'
gem 'responders'
gem 'simple_form'
gem 'rmagick'
gem 'paperclip', '~> 4.3.7'
gem 'rails_12factor', group: :production
gem 'cancancan'
gem 'postmark-rails'
gem 'houston'
gem 'gcm'
gem 'iso-639'

# Background processing
gem 'sidekiq'
gem 'whenever'
gem 'sinatra', require: false # for 'sidekiq/web'

group :production do
  # gem 'unicorn'
  gem 'pg'
end

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'web-console', '~> 2.0', group: :development

group :development, :test do
  gem 'pry-rails'
  gem 'pry-nav', require: false
  gem 'byebug'
  gem 'webmock'
  gem 'mocha'
  gem 'minitest-reporters'
  gem 'minitest-stub-const'
  gem 'minitest-rails-capybara'
  gem 'poltergeist'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
end
