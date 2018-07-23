Rails.application.routes.draw do
  # devise_for :users, only: %i[omniauth_callbacks], controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  # }
  scope path: 'tomozipkamechan' do
    namespace :admin, path: '/' do
      root 'dashboard#index'
      resources :articles, only: %i[show update]
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, defaults: { format: :json }

  namespace :v1, defaults: { format: 'json' } do
    resources :users do
      resources :reviews, only: [:index], module: :users
      resources :reactions, only: [:index], module: :users

      collection do
        get :me
      end

      member do
        get :following, to: 'users/relationships#following'
        get :followers, to: 'users/relationships#followers'
        post :follow, to: 'users/relationships#follow'
        delete :follow, to: 'users/relationships#unfollow'
      end

      scope :following do
        resources :reviews, only: [:index]
        resources :review_evaluations, only: [:index]
      end

      resources :reviews, only: [:index]
      resources :review_evaluations, only: [:index]
    end

    resources :hash_tags, only: [:index, :show] do
      member do
        post :watch, action: :watch
        delete :watch, action: :unwatch
      end
      resources :articles, only: [:index]
    end

    resources :articles, only: [:show, :index, :create, :destroy] do
      # FIXME: 記事ごとのコメントを取得(articles/1234/reviews)するものであり、userごとのコメント取得と被らないようにmoduleを設定している。下の二つのルーティングは同じコントローラーに統合したい。
      collection do
        get :trend
      end
      resources :reviews, only: [:index], module: :articles
      resources :reviews, only: [:create]
    end
    resources :reviews, only: [:destroy] do
      member do
        post :like, to: 'reviews/reactions#add_like'
        delete :like, to: 'reviews/reactions#delete_like'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
