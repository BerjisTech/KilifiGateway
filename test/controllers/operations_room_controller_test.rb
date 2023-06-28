# frozen_string_literal: true

require 'test_helper'

class OperationsRoomControllerTest < ActionDispatch::IntegrationTest
  test 'should get command_center' do
    get operations_room_command_center_url
    assert_response :success
  end

  test 'should get stores' do
    get operations_room_stores_url
    assert_response :success
  end

  test 'should get branches' do
    get operations_room_branches_url
    assert_response :success
  end

  test 'should get products' do
    get operations_room_products_url
    assert_response :success
  end

  test 'should get services' do
    get operations_room_services_url
    assert_response :success
  end

  test 'should get on_demand_services' do
    get operations_room_on_demand_services_url
    assert_response :success
  end

  test 'should get treasury' do
    get operations_room_treasury_url
    assert_response :success
  end

  test 'should get support' do
    get operations_room_support_url
    assert_response :success
  end
end
