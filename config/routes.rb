Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  namespace :v1, defaults: { format: 'json' } do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index]

      collection do
        get :me
      end

      member do
        get :following
        get :followers
        post :follow
        delete :follow
      end

      scope :following do
        resources :posts, only: [:index]
        resources :post_evaluations, only: [:index]
      end

      resources :posts, only: [:index]
      resources :post_evaluations, only: [:index]
    end

    resources :hash_tags, only: [:index, :show] do
      member do
        post :watch, action: :watch
        delete :watch, action: :unwatch
      end
      resources :articles, only: [:index]
    end

    resources :articles, only: [:index, :create] do
      # FIXME: 記事ごとのコメントを取得(articles/1234/posts)するものであり、userごとのコメント取得と被らないようにmoduleを設定している。下の二つのルーティングは同じコントローラーに統合したい。
      resources :posts, only: [:index], module: :articles
      resources :posts, only: [:create, :destroy]
    end
    resources :posts, only: [] do
      member do
        post :like, to: 'posts/reactions#add_like'
        delete :like, to: 'posts/reactions#delete_like'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
