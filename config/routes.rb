Rails.application.routes.draw do
  resources :accomodations
  resources :offers
  resources :companies
  resources :users

  namespace :admin do
    root to: 'dashboard#index'
    resources :users, :accomodations, :offers, :companies, :users, :cities, :countries, :heatings, :join_table_secondaries, :join_table_tertiaries, :operation_types, :road_types, :secondary_criteria, :tertiary_criteria, :type_of_properties
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
