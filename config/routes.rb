Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  namespace :v1, defaults: { format: 'json' } do
    resources :users, only: [:index, :show]
    resources :hashtags, only: [:index, :show] do
      resources :posts, only: [:index]
    end
    resources :posts, only: [:index, :show, :create, :destroy]
    resources :post_evaluations, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
