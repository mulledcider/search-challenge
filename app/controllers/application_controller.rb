# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    if params[:search]
      search = params.require(:search).permit(
        :user_column, :organization_column, :ticket_column, :user_q,
        :organization_q, :ticket_q, :model
      )
      model = search[:model]

      @results = model
                  &.capitalize
                  &.constantize
                  &.where(search["#{model}_column"] => search["#{model}_q"])
    end
  end
end
