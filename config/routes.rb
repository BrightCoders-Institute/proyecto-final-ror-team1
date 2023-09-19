# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  root to: 'shipments#index'
  get 'shipments/index'

  get '/shipments/status/:status', to: 'shipments#index', as: :shipments_by_status
  get '/shipments/carrier/:carrier', to: 'shipments#index', as: :shipments_by_carrier
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/shipments/new', to: 'shipments#new', as: :new_shipment
  post '/shipments', to: 'shipments#create', as: 'create_shipment'
  get '/shipments/:id', to: 'shipments#show', as: 'shipment'
end
