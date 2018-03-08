Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]

  resources :users do
    resources :timesheet, only: [:index]
  end
end
