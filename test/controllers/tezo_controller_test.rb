# frozen_string_literal: true

require 'test_helper'

class TezoControllerTest < ActionDispatch::IntegrationTest
  test 'should get center' do
    get tezo_center_url
    assert_response :success
  end
end
