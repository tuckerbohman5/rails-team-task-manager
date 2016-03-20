Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#home'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  resources :projects do 
    resources :tasks
  end

end
