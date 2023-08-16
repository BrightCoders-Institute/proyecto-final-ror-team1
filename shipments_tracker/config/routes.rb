Rails.application.routes.draw do
  get 'shipments/index'
  get '/shipments/status/:status', to: 'shipments#index', as: :shipments_by_status
  get '/shipments/carrier/:carrier', to: 'shipments#index', as: :shipments_by_carrier
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/shipments/:id', to: 'shipments#show', as: 'shipment'
end
