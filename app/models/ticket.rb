# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :submitter, class_name: 'User', optional: true
  belongs_to :assignee, class_name: 'User', optional: true

  # disable STI
  self.inheritance_column = :_type_disabled

  serialize :tags, Array

  def self.create_from_json!
    parsed = JSON.parse(File.read('data/tickets.json'))
    Ticket.create!(parsed)
  end
end
