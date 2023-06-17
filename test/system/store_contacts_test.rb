require "application_system_test_case"

class StoreContactsTest < ApplicationSystemTestCase
  setup do
    @store_contact = store_contacts(:one)
  end

  test "visiting the index" do
    visit store_contacts_url
    assert_selector "h1", text: "Store contacts"
  end

  test "should create store contact" do
    visit store_contacts_url
    click_on "New store contact"

    fill_in "Branch", with: @store_contact.branch_id
    fill_in "Contact info", with: @store_contact.contact_info
    fill_in "Store", with: @store_contact.store_id
    click_on "Create Store contact"

    assert_text "Store contact was successfully created"
    click_on "Back"
  end

  test "should update Store contact" do
    visit store_contact_url(@store_contact)
    click_on "Edit this store contact", match: :first

    fill_in "Branch", with: @store_contact.branch_id
    fill_in "Contact info", with: @store_contact.contact_info
    fill_in "Store", with: @store_contact.store_id
    click_on "Update Store contact"

    assert_text "Store contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Store contact" do
    visit store_contact_url(@store_contact)
    click_on "Destroy this store contact", match: :first

    assert_text "Store contact was successfully destroyed"
  end
end
