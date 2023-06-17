# frozen_string_literal: true

require 'application_system_test_case'

class SearchesTest < ApplicationSystemTestCase
  setup do
    @search = searches(:one)
  end

  test 'visiting the index' do
    visit searches_url
    assert_selector 'h1', text: 'Searches'
  end

  test 'should create search' do
    visit searches_url
    click_on 'New search'

    fill_in 'Category', with: @search.category
    fill_in 'Ip', with: @search.ip
    fill_in 'Location', with: @search.location
    fill_in 'Referer', with: @search.referer
    fill_in 'Term', with: @search.term
    fill_in 'User', with: @search.user_id
    click_on 'Create Search'

    assert_text 'Search was successfully created'
    click_on 'Back'
  end

  test 'should update Search' do
    visit search_url(@search)
    click_on 'Edit this search', match: :first

    fill_in 'Category', with: @search.category
    fill_in 'Ip', with: @search.ip
    fill_in 'Location', with: @search.location
    fill_in 'Referer', with: @search.referer
    fill_in 'Term', with: @search.term
    fill_in 'User', with: @search.user_id
    click_on 'Update Search'

    assert_text 'Search was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Search' do
    visit search_url(@search)
    click_on 'Destroy this search', match: :first

    assert_text 'Search was successfully destroyed'
  end
end
