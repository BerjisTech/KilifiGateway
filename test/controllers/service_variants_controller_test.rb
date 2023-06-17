require "test_helper"

class ServiceVariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_variant = service_variants(:one)
  end

  test "should get index" do
    get service_variants_url
    assert_response :success
  end

  test "should get new" do
    get new_service_variant_url
    assert_response :success
  end

  test "should create service_variant" do
    assert_difference("ServiceVariant.count") do
      post service_variants_url, params: { service_variant: { description: @service_variant.description, name: @service_variant.name, service_id: @service_variant.service_id } }
    end

    assert_redirected_to service_variant_url(ServiceVariant.last)
  end

  test "should show service_variant" do
    get service_variant_url(@service_variant)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_variant_url(@service_variant)
    assert_response :success
  end

  test "should update service_variant" do
    patch service_variant_url(@service_variant), params: { service_variant: { description: @service_variant.description, name: @service_variant.name, service_id: @service_variant.service_id } }
    assert_redirected_to service_variant_url(@service_variant)
  end

  test "should destroy service_variant" do
    assert_difference("ServiceVariant.count", -1) do
      delete service_variant_url(@service_variant)
    end

    assert_redirected_to service_variants_url
  end
end
