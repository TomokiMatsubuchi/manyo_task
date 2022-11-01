Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  namespace :admin do
    resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :labels
  
  #get  '*path', controller: 'application', action: 'render_404'
  #post '*path', controller: 'application', action: 'render_404'
end
