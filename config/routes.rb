require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, skip: :omniauth_callbacks

    namespace :admin do
      resources :pages
    end

<<<<<<< HEAD
  namespace :admin do
    resources :pages
    resources :add_users
  end

  get "home", to: "home#index"
=======
    get "home", to: "home#index"
>>>>>>> 2fc115f9d6a30b66809abdcd6e428b7956e16e50

    resources :organizations, :requests
    resources :attachments, only: [:show, :destroy]

    root "home#index"
  end
end
