Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events
  resources :users, only: %i[show edit update]
end
