require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, skip: :omniauth_callbacks

    namespace :admin do
      resources :pages
    end

    get "home", to: "home#index"

    resources :organizations, :requests
    resources :attachments, only: [:show, :destroy]

    root "home#index"
  end
end
