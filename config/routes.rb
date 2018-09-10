# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', action: 'index', controller: 'application'
  post '/', action: 'index', controller: 'application'
end
