Rails.application.routes.draw do
  get 'service/index'
  resources :service, only: [:index]
  resources :team, only: [:index]
  resources :contact
  root to: 'homepage#index'

  devise_for :users
  resources :accomodations do
    resources :photo, only: [:create]
    resources :favorite, only: [:create]
  end
  resources :charges
  resources :search, only: [:index]
  resources :offers
  resources :companies
  resources :users, only: [:show] do
    resources :profile_picture, only: [:create]
  end

  namespace :admin do
    root to: 'dashboard#index'
    resources :users, :accomodations, :offers, :companies, :users, :cities, :countries, :heatings, :join_table_secondaries, :join_table_tertiaries, :operation_types, :road_types, :secondary_criteria, :tertiary_criteria, :type_of_properties
  end
  resources :mon_profil, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
