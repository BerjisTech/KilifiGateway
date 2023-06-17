# frozen_string_literal: true

require 'application_system_test_case'

class ServiceVariantsTest < ApplicationSystemTestCase
  setup do
    @service_variant = service_variants(:one)
  end

  test 'visiting the index' do
    visit service_variants_url
    assert_selector 'h1', text: 'Service variants'
  end

  test 'should create service variant' do
    visit service_variants_url
    click_on 'New service variant'

    fill_in 'Description', with: @service_variant.description
    fill_in 'Name', with: @service_variant.name
    fill_in 'Service', with: @service_variant.service_id
    click_on 'Create Service variant'

    assert_text 'Service variant was successfully created'
    click_on 'Back'
  end

  test 'should update Service variant' do
    visit service_variant_url(@service_variant)
    click_on 'Edit this service variant', match: :first

    fill_in 'Description', with: @service_variant.description
    fill_in 'Name', with: @service_variant.name
    fill_in 'Service', with: @service_variant.service_id
    click_on 'Update Service variant'

    assert_text 'Service variant was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Service variant' do
    visit service_variant_url(@service_variant)
    click_on 'Destroy this service variant', match: :first

    assert_text 'Service variant was successfully destroyed'
  end
end
