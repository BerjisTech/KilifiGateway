require "test_helper"

class GovernmentFacilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @government_facility = government_facilities(:one)
  end

  test "should get index" do
    get government_facilities_url
    assert_response :success
  end

  test "should get new" do
    get new_government_facility_url
    assert_response :success
  end

  test "should create government_facility" do
    assert_difference("GovernmentFacility.count") do
      post government_facilities_url, params: { government_facility: { location: @government_facility.location, name: @government_facility.name, type: @government_facility.type } }
    end

    assert_redirected_to government_facility_url(GovernmentFacility.last)
  end

  test "should show government_facility" do
    get government_facility_url(@government_facility)
    assert_response :success
  end

  test "should get edit" do
    get edit_government_facility_url(@government_facility)
    assert_response :success
  end

  test "should update government_facility" do
    patch government_facility_url(@government_facility), params: { government_facility: { location: @government_facility.location, name: @government_facility.name, type: @government_facility.type } }
    assert_redirected_to government_facility_url(@government_facility)
  end

  test "should destroy government_facility" do
    assert_difference("GovernmentFacility.count", -1) do
      delete government_facility_url(@government_facility)
    end

    assert_redirected_to government_facilities_url
  end
end
