Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'

  devise_for :users

  resources :categories


  scope '/admin'  do
    resources :contents
    resources :testimonials
    resources :abouts
  end


end
