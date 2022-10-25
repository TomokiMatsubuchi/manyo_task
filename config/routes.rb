Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  namespace :admin do
    resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
