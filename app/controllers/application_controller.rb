# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    if params[:search]
      search = params.require(:search).permit(
        :user_column, :organization_column, :ticket_column, :user_q,
        :organization_q, :ticket_q, :model
      )
      model = search[:model]
      term = (search[:is_empty] ? nil : search["#{model}_q"])

      @results = model
                  &.capitalize
                  &.constantize
                  &.where(search["#{model}_column"] => term)
    end
  end
end
