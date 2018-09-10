# frozen_string_literal: true

class Organization < ApplicationRecord
  serialize :tags, Array
  serialize :domain_names, Array

  def self.create_from_json!
    parsed = JSON.parse(File.read('data/organizations.json'))
    Organization.create!(parsed.map { |h| h['id'] = h.delete('_id'); h })
  end
end
