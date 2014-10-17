Rails.application.routes.draw do
  root to: 'needs#index'
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }

  resources :needs
  resources :users, only: [:show]
  resources :help_offers

end
