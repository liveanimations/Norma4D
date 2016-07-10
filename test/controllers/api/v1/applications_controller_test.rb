require 'test_helper'

class Api::V1::ApplicationsControllerTest < ActionController::TestCase
  def application
    applications(:one)
  end

  def application_json
    JSON.parse(applications(:one).to_json).deep_symbolize_keys
  end

  def device
    devices(:ios_device_ru)
  end

  def device_two
    devices(:ios_device_ru_two)
  end

  def api_token
    Rails.application.secrets.api_token
  end

  test 'unauthorized when token is not passed' do
    get :show, id: application
    assert_response :unauthorized
  end

  test 'unauthorized when token is wrong' do
    get :show, id: application, api_token: 'potato'
    assert_response :unauthorized
  end

  test 'returns application' do
    get :show, id: application, api_token: api_token
    assert_equal application.to_json, assigns(:application).to_json
    assert_response :success
  end

  test 'returns only avaliable collections for application' do
    get :show, id: application, api_token: api_token
    assert_equal(
      application.collections.where(hide: false).pluck(:id).sort,
      application_json[:collections].map { |c| c[:id] }.sort
    )
    assert_response :success
  end

  test 'returns only avaliable effects for application' do
    get :show, id: application, api_token: api_token
    assert_equal(
      application.effects.where(hide: false).pluck(:id).sort,
      application_json[:effects].map { |c| c[:id] }.sort
    )
    assert_response :success
  end

  test 'returns commercials for application' do
    get :show, id: application, api_token: api_token
    assert_equal(
      application.commercials.pluck(:id).sort,
      application_json[:commercials].map { |c| c[:id] }.sort
    )
    assert_response :success
  end
end
