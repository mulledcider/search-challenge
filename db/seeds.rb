# frozen_string_literal: true

User.destroy_all
Organization.destroy_all
Ticket.destroy_all

Organization.create_from_json!
User.create_from_json!
Ticket.create_from_json!
