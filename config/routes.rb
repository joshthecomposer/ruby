Rails.application.routes.draw do
  root 'pages#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  delete '/logout', to: 'sessions#destroy', as: :logout
end
