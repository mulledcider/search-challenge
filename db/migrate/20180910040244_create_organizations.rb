# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :url
      t.string :external_id
      t.string :name
      t.text :domain_names
      t.string :details
      t.boolean :shared_tickets
      t.text :tags

      t.timestamps
    end
  end
end
