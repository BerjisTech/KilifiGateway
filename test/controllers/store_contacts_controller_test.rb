# frozen_string_literal: true

require 'test_helper'

class StoreContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_contact = store_contacts(:one)
  end

  test 'should get index' do
    get store_contacts_url
    assert_response :success
  end

  test 'should get new' do
    get new_store_contact_url
    assert_response :success
  end

  test 'should create store_contact' do
    assert_difference('StoreContact.count') do
      post store_contacts_url,
           params: { store_contact: { branch_id: @store_contact.branch_id, contact_info: @store_contact.contact_info,
                                      store_id: @store_contact.store_id } }
    end

    assert_redirected_to store_contact_url(StoreContact.last)
  end

  test 'should show store_contact' do
    get store_contact_url(@store_contact)
    assert_response :success
  end

  test 'should get edit' do
    get edit_store_contact_url(@store_contact)
    assert_response :success
  end

  test 'should update store_contact' do
    patch store_contact_url(@store_contact),
          params: { store_contact: { branch_id: @store_contact.branch_id, contact_info: @store_contact.contact_info,
                                     store_id: @store_contact.store_id } }
    assert_redirected_to store_contact_url(@store_contact)
  end

  test 'should destroy store_contact' do
    assert_difference('StoreContact.count', -1) do
      delete store_contact_url(@store_contact)
    end

    assert_redirected_to store_contacts_url
  end
end
