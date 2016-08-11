ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'minitest/mock'

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

reporter_options = { color: true }
Minitest::Reporters.use!(
  Minitest::Reporters::DefaultReporter.new(reporter_options),
  ENV,
  Minitest.backtrace_filter
)

class ControllerTest < ActionController::TestCase
  fixtures :all
  include Devise::TestHelpers
  setup do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  def assert_user_unauthorized(user, action, params = {})
    sign_in user
    get action, params
    assert_response :unauthorized
  end
end

class ActiveSupport::TestCase
  include ActiveJob::TestHelper
  include ActionDispatch::TestProcess

  fixtures :all

  def update_user_last_seen(user_key)
    UpdateUserLastSeen.new(users(user_key)).perform
  end
end

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

