Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]
  get 'home/swipe', to: 'home#swipe'
  post 'home/swipe_in', to: 'home#swipe_in'
  post 'home/swipe_out', to: 'home#swipe_out'
  post 'home/time_sheet', to: 'home#time_sheet'
  post 'home/time_off', to: 'home#time_off'

  resources :users do
    resources :timesheets, only: [:index]
    resources :shifts, only: [:create, :edit, :update, :destroy]
  end
  resources :requests, only: [:index, :new, :create, :edit, :update]
  post 'requests/:id/update_status', to: 'requests#update_status', as: 'update_status_request'
  resources :positions, except: [:show]
  resources :divisions, except: [:show]
  resources :unions, except: [:show]
end
