Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#home'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
end
