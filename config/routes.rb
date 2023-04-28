Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :users, except: :index
  resources :sessions, only: %i(new create destroy)
  namespace :admin do
    resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
end
