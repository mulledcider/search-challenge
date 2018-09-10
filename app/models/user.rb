# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :organization, optional: true

  def self.create_from_json!
    parsed = JSON.parse(File.read('data/users.json'))
    User.create!(parsed.map { |h| h['id'] = h.delete('_id'); h })
  end
end
