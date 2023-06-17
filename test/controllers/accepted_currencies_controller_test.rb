# frozen_string_literal: true

require 'test_helper'

class AcceptedCurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accepted_currency = accepted_currencies(:one)
  end

  test 'should get index' do
    get accepted_currencies_url
    assert_response :success
  end

  test 'should get new' do
    get new_accepted_currency_url
    assert_response :success
  end

  test 'should create accepted_currency' do
    assert_difference('AcceptedCurrency.count') do
      post accepted_currencies_url,
           params: { accepted_currency: { code: @accepted_currency.code, code_three: @accepted_currency.code_three,
                                          conversion_rate: @accepted_currency.conversion_rate, country: @accepted_currency.country, name: @accepted_currency.name, value_against_dollar: @accepted_currency.value_against_dollar } }
    end

    assert_redirected_to accepted_currency_url(AcceptedCurrency.last)
  end

  test 'should show accepted_currency' do
    get accepted_currency_url(@accepted_currency)
    assert_response :success
  end

  test 'should get edit' do
    get edit_accepted_currency_url(@accepted_currency)
    assert_response :success
  end

  test 'should update accepted_currency' do
    patch accepted_currency_url(@accepted_currency),
          params: { accepted_currency: { code: @accepted_currency.code, code_three: @accepted_currency.code_three,
                                         conversion_rate: @accepted_currency.conversion_rate, country: @accepted_currency.country, name: @accepted_currency.name, value_against_dollar: @accepted_currency.value_against_dollar } }
    assert_redirected_to accepted_currency_url(@accepted_currency)
  end

  test 'should destroy accepted_currency' do
    assert_difference('AcceptedCurrency.count', -1) do
      delete accepted_currency_url(@accepted_currency)
    end

    assert_redirected_to accepted_currencies_url
  end
end
