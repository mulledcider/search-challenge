# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    User.destroy_all
  end

  test 'create_from_json!' do
    User.create_from_json!
    assert_equal 75, User.count
  end
end
