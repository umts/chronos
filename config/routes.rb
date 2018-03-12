Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]

  resources :positions, only: [:index, :new, :create, :destroy]
  resources :divisions, only: [:index, :new, :create, :destroy]
  resources :unions, only: [:index, :new, :create, :destroy]
end
