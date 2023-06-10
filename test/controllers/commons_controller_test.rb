# frozen_string_literal: true

require 'test_helper'

class CommonsControllerTest < ActionDispatch::IntegrationTest
  test 'should get search' do
    get commons_search_url
    assert_response :success
  end
end
