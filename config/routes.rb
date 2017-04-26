Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'

  devise_for :users

  resources :categories
  resources :testimonials, only: [ :index, :edit, :update ]
  resources :about

  scope '/admin'  do
    resources :contents
  end


end
