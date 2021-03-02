Rails.application.routes.draw do
  root to: 'blogs#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: %i[new create]
  resources :blogs
end
