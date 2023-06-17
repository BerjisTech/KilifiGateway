require "test_helper"

class OnDemandServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @on_demand_service = on_demand_services(:one)
  end

  test "should get index" do
    get on_demand_services_url
    assert_response :success
  end

  test "should get new" do
    get new_on_demand_service_url
    assert_response :success
  end

  test "should create on_demand_service" do
    assert_difference("OnDemandService.count") do
      post on_demand_services_url, params: { on_demand_service: { description: @on_demand_service.description, name: @on_demand_service.name, service_provider_id: @on_demand_service.service_provider_id } }
    end

    assert_redirected_to on_demand_service_url(OnDemandService.last)
  end

  test "should show on_demand_service" do
    get on_demand_service_url(@on_demand_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_on_demand_service_url(@on_demand_service)
    assert_response :success
  end

  test "should update on_demand_service" do
    patch on_demand_service_url(@on_demand_service), params: { on_demand_service: { description: @on_demand_service.description, name: @on_demand_service.name, service_provider_id: @on_demand_service.service_provider_id } }
    assert_redirected_to on_demand_service_url(@on_demand_service)
  end

  test "should destroy on_demand_service" do
    assert_difference("OnDemandService.count", -1) do
      delete on_demand_service_url(@on_demand_service)
    end

    assert_redirected_to on_demand_services_url
  end
end
