require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :pages
  end

  get "home", to: "home#index"

  root "home#index"
  resources :organizations, :requests
  resources :attachments, only: [:show, :destroy]

end
