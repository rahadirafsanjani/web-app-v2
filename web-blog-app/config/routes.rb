  Rails.application.routes.draw do
    devise_for :users
    resources :posts do
      resources :comments
    end

    root "home#root"
    get '/comments/:id/edit', to: 'comments#edit', as: :edit_comment
    put '/comments/:id/edit', to: 'comments#update', as: :update_comment

    delete '/comments/:id/destroy', to: 'comments#destroy', as: :destroy_comment


  # manual setup
    devise_scope :user do
      # Redirests signing out users back to sign-in
      get "users" => "devise/sessions#new"
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  end

