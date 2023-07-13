# frozen_string_literal: true

Rails.application.routes.draw do
  resources :donations
  devise_for :users
  resources :donors
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
