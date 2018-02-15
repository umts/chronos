Rails.application.routes.draw do
  root 'application#root'

  resources :home, only: [:index]
end
