Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]

  resources :positions, only: [:index, :new, :create, :destroy]
end
