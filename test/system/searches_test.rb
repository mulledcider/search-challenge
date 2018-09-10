# frozen_string_literal: true

require 'application_system_test_case'

class SearchesTest < ApplicationSystemTestCase
  def setup
    User.destroy_all
    Organization.destroy_all
    Ticket.destroy_all

    Organization.create_from_json!
    User.create_from_json!
    Ticket.create_from_json!
  end

  test 'search by user name' do
    visit '/'

    select('name', from: 'search_user_column')
    fill_in 'search_user_q', with: 'Cross Barlow'

    click_on '🔍 Users'

    assert_selector 'h2', text: '1 result'
  end

  test 'search by user active' do
    visit '/'

    select('active', from: 'search_user_column')
    fill_in 'search_user_q', with: 'true'

    click_on '🔍 Users'

    assert_selector 'h2', text: '39 results'
  end

  test 'search by organization name' do
    visit '/'

    select('name', from: 'search_organization_column')
    fill_in 'search_organization_q', with: 'Xylar'

    click_on '🔍 Organizations'

    assert_selector 'h2', text: '1 result'
  end

  test 'search by ticket status' do
    visit '/'

    select('status', from: 'search_ticket_column')
    fill_in 'search_ticket_q', with: 'pending'

    click_on '🔍 Tickets'

    assert_selector 'h2', text: '45 results'
  end
end
