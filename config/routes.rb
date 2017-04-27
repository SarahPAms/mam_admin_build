Rails.application.routes.draw do
  root to: 'pages#home'
  get 'bios', to: 'pages#bios'
  get 'home', to: 'pages#home'
  get 'ailment', to: 'pages#index'
  get 'ailment/:id', to: 'pages#show'

  devise_for :users

  # resources :categories, only: [:index, :show]


  scope '/admin'  do
    resources :contents
    resources :testimonials
    resources :abouts
    resources :categories
  end
end
