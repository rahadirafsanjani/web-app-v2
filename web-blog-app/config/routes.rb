  Rails.application.routes.draw do
    devise_for :users
    resources :posts do
      resources :comments
    end

    root "home#root"


  # manual setup
    devise_scope :user do
      # Redirests signing out users back to sign-in
      get "users", to: "devise/sessions#new"
    end
  end

