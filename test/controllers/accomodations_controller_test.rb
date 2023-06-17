# frozen_string_literal: true

require 'test_helper'

class AccomodationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accomodation = accomodations(:one)
  end

  test 'should get index' do
    get accomodations_url
    assert_response :success
  end

  test 'should get new' do
    get new_accomodation_url
    assert_response :success
  end

  test 'should create accomodation' do
    assert_difference('Accomodation.count') do
      post accomodations_url,
           params: { accomodation: { balcony: @accomodation.balcony, bathrooms: @accomodation.bathrooms,
                                     bedrooms: @accomodation.bedrooms, description: @accomodation.description, location: @accomodation.location, owner_id: @accomodation.owner_id } }
    end

    assert_redirected_to accomodation_url(Accomodation.last)
  end

  test 'should show accomodation' do
    get accomodation_url(@accomodation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_accomodation_url(@accomodation)
    assert_response :success
  end

  test 'should update accomodation' do
    patch accomodation_url(@accomodation),
          params: { accomodation: { balcony: @accomodation.balcony, bathrooms: @accomodation.bathrooms,
                                    bedrooms: @accomodation.bedrooms, description: @accomodation.description, location: @accomodation.location, owner_id: @accomodation.owner_id } }
    assert_redirected_to accomodation_url(@accomodation)
  end

  test 'should destroy accomodation' do
    assert_difference('Accomodation.count', -1) do
      delete accomodation_url(@accomodation)
    end

    assert_redirected_to accomodations_url
  end
end
