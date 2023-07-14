# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions'
      }
    end
  end

  resources :donations
  resources :companies
  resources :donors

  get '/list_donations', to: 'donations#list_donations'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
