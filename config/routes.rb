Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]

  resources :users do
    resources :timesheet, only: [:index]
  end
  resources :positions, only: [:index, :new, :create, :destroy]
  resources :divisions, only: [:index, :new, :create, :destroy]
  resources :unions, only: [:index, :new, :create, :destroy]
end
