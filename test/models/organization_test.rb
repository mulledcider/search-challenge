# frozen_string_literal: true

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    Organization.destroy_all
  end

  test 'create_from_json!' do
    Organization.create_from_json!
    assert_equal 26, Organization.count
  end
end
