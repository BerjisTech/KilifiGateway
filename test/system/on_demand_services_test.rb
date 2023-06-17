# frozen_string_literal: true

require 'application_system_test_case'

class OnDemandServicesTest < ApplicationSystemTestCase
  setup do
    @on_demand_service = on_demand_services(:one)
  end

  test 'visiting the index' do
    visit on_demand_services_url
    assert_selector 'h1', text: 'On demand services'
  end

  test 'should create on demand service' do
    visit on_demand_services_url
    click_on 'New on demand service'

    fill_in 'Description', with: @on_demand_service.description
    fill_in 'Name', with: @on_demand_service.name
    fill_in 'Service provider', with: @on_demand_service.service_provider_id
    click_on 'Create On demand service'

    assert_text 'On demand service was successfully created'
    click_on 'Back'
  end

  test 'should update On demand service' do
    visit on_demand_service_url(@on_demand_service)
    click_on 'Edit this on demand service', match: :first

    fill_in 'Description', with: @on_demand_service.description
    fill_in 'Name', with: @on_demand_service.name
    fill_in 'Service provider', with: @on_demand_service.service_provider_id
    click_on 'Update On demand service'

    assert_text 'On demand service was successfully updated'
    click_on 'Back'
  end

  test 'should destroy On demand service' do
    visit on_demand_service_url(@on_demand_service)
    click_on 'Destroy this on demand service', match: :first

    assert_text 'On demand service was successfully destroyed'
  end
end
