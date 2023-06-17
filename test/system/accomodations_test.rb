require "application_system_test_case"

class AccomodationsTest < ApplicationSystemTestCase
  setup do
    @accomodation = accomodations(:one)
  end

  test "visiting the index" do
    visit accomodations_url
    assert_selector "h1", text: "Accomodations"
  end

  test "should create accomodation" do
    visit accomodations_url
    click_on "New accomodation"

    check "Balcony" if @accomodation.balcony
    fill_in "Bathrooms", with: @accomodation.bathrooms
    fill_in "Bedrooms", with: @accomodation.bedrooms
    fill_in "Description", with: @accomodation.description
    fill_in "Location", with: @accomodation.location
    fill_in "Owner", with: @accomodation.owner_id
    click_on "Create Accomodation"

    assert_text "Accomodation was successfully created"
    click_on "Back"
  end

  test "should update Accomodation" do
    visit accomodation_url(@accomodation)
    click_on "Edit this accomodation", match: :first

    check "Balcony" if @accomodation.balcony
    fill_in "Bathrooms", with: @accomodation.bathrooms
    fill_in "Bedrooms", with: @accomodation.bedrooms
    fill_in "Description", with: @accomodation.description
    fill_in "Location", with: @accomodation.location
    fill_in "Owner", with: @accomodation.owner_id
    click_on "Update Accomodation"

    assert_text "Accomodation was successfully updated"
    click_on "Back"
  end

  test "should destroy Accomodation" do
    visit accomodation_url(@accomodation)
    click_on "Destroy this accomodation", match: :first

    assert_text "Accomodation was successfully destroyed"
  end
end
