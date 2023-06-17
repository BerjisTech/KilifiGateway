require "application_system_test_case"

class AcceptedCurrenciesTest < ApplicationSystemTestCase
  setup do
    @accepted_currency = accepted_currencies(:one)
  end

  test "visiting the index" do
    visit accepted_currencies_url
    assert_selector "h1", text: "Accepted currencies"
  end

  test "should create accepted currency" do
    visit accepted_currencies_url
    click_on "New accepted currency"

    fill_in "Code", with: @accepted_currency.code
    fill_in "Code three", with: @accepted_currency.code_three
    fill_in "Conversion rate", with: @accepted_currency.conversion_rate
    fill_in "Country", with: @accepted_currency.country
    fill_in "Name", with: @accepted_currency.name
    fill_in "Value against dollar", with: @accepted_currency.value_against_dollar
    click_on "Create Accepted currency"

    assert_text "Accepted currency was successfully created"
    click_on "Back"
  end

  test "should update Accepted currency" do
    visit accepted_currency_url(@accepted_currency)
    click_on "Edit this accepted currency", match: :first

    fill_in "Code", with: @accepted_currency.code
    fill_in "Code three", with: @accepted_currency.code_three
    fill_in "Conversion rate", with: @accepted_currency.conversion_rate
    fill_in "Country", with: @accepted_currency.country
    fill_in "Name", with: @accepted_currency.name
    fill_in "Value against dollar", with: @accepted_currency.value_against_dollar
    click_on "Update Accepted currency"

    assert_text "Accepted currency was successfully updated"
    click_on "Back"
  end

  test "should destroy Accepted currency" do
    visit accepted_currency_url(@accepted_currency)
    click_on "Destroy this accepted currency", match: :first

    assert_text "Accepted currency was successfully destroyed"
  end
end
