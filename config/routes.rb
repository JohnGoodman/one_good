Rails.application.routes.draw do
  root to: 'needs#index'
  devise_for :users

  resources :needs
  resources :users, only: [:show]
end
