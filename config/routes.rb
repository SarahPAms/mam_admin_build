Rails.application.routes.draw do
  root to: 'pages#home'
  get 'bios', to: 'pages#bios'

  devise_for :users

  # resources :categories, only: [:index, :show]


  scope '/admin'  do
    resources :contents
    resources :testimonials
    resources :abouts
    resources :categories
  end
end
