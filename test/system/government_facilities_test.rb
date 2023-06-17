require "application_system_test_case"

class GovernmentFacilitiesTest < ApplicationSystemTestCase
  setup do
    @government_facility = government_facilities(:one)
  end

  test "visiting the index" do
    visit government_facilities_url
    assert_selector "h1", text: "Government facilities"
  end

  test "should create government facility" do
    visit government_facilities_url
    click_on "New government facility"

    fill_in "Location", with: @government_facility.location
    fill_in "Name", with: @government_facility.name
    fill_in "Type", with: @government_facility.type
    click_on "Create Government facility"

    assert_text "Government facility was successfully created"
    click_on "Back"
  end

  test "should update Government facility" do
    visit government_facility_url(@government_facility)
    click_on "Edit this government facility", match: :first

    fill_in "Location", with: @government_facility.location
    fill_in "Name", with: @government_facility.name
    fill_in "Type", with: @government_facility.type
    click_on "Update Government facility"

    assert_text "Government facility was successfully updated"
    click_on "Back"
  end

  test "should destroy Government facility" do
    visit government_facility_url(@government_facility)
    click_on "Destroy this government facility", match: :first

    assert_text "Government facility was successfully destroyed"
  end
end
