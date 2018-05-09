Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]

  resources :users do
    resources :timesheets, only: [:index]
    resources :shifts, only: [:create, :edit, :update, :destroy]
  end
  resources :positions, except: [:show]
  resources :divisions, except: [:show]
  resources :unions, except: [:show]
end
