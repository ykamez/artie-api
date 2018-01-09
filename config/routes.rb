Rails.application.routes.draw do
  namespace :v1 do
    namespace :users do
      get 'hashtag/watching'
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  namespace :v1, defaults: { format: 'json' } do
    resources :users, only: [:index, :show] do
      collection do
        get :me
      end
      member do
        scope :hashtags do
          get :watching, to: 'users/hashtags#watching'
        end
      end
    end

    resources :hashtags do
      collection do
        get :trend
      end
    end

    resources :hashtags, only: [:index, :show] do
      member do
        post :watch, action: :watch
        delete :watch, action: :unwatch
      end
      resources :posts, only: [:index], to: 'hashtags#show'
    end

    resources :posts, only: [:index, :show, :create, :destroy] do
      member do
        get :replies
        post :like, to: 'posts/reactions#add_like'
        post :dislike, to: 'posts/reactions#add_dislike'
        delete :like, to: 'posts/reactions#delete_like'
        delete :dislike, to: 'posts/reactions#delete_dislike'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
