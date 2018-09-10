# frozen_string_literal: true

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  def setup
    Ticket.destroy_all
  end

  test 'create_from_json!()' do
    Ticket.create_from_json!
    assert_equal 200, Ticket.count
  end
end
