Rails.application.routes.draw do
  resources :events
  devise_for :users
  root "tasks#index"
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :mypage, only: [:index, :show]
  resources :events
  # root 'events#index'
end
