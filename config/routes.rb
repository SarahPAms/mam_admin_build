Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'

  devise_for :users

  resources :categories
  resources :about

  scope '/admin'  do
    resources :contents
    resources :testimonials
  end


end
