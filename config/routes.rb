Rails.application.routes.draw do
  root 'pages#home'
  get 'about' => 'pages#about'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
