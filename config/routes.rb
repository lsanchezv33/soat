# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Use to user session --------------------
  devise_for :users

  # Use to path app ------------------------
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # Matches --------------------------------
  match '/home', to: 'dashboard#index', via: :get, as: :home
  match '/customers', to: 'dashboard#customers', via: :get, as: :customers
  match '/customers/policies', to: 'dashboard#customer_policies', via: :get, as: :customers_policies

  # Resources ------------------------------
  resources :users, only: [:index, :show, :destroy] do
    resources :vehicles
  end

  resources :trade_charges

  resources :vehicles do
    resources :policy_payments
  end
end
