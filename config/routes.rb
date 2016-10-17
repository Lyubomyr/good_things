require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  namespace :admin do
    resources :pages
    resources :add_users
  end

  get "home", to: "home#index"

  root "home#index"
  resources :organizations, :requests
  resources :attachments, only: [:show, :destroy]

end
