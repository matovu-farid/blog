Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index,:show] do
    resources :posts do
      resources :comments, only: [:new,:create,:edit,:update, :destroy]
      resources :likes, only:[:create]
    end
  end
end
