Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'        # その他のルート
  resources :users, only: [:show,:index]
  resources :prototypes
end