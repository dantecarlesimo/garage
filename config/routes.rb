Garage::Application.routes.draw do
  root 'pages#index'  

  devise_for :users
  resources :sales
  resources :pages

  get '/user_sales', to: 'pages#user_sales', as: :user_sales
  get '/user_items', to: 'pages#user_items', as: :user_items
  get '/user_transactions', to: 'pages#user_transactions', as: :user_transactions

  post '/sales/:sale_id/items', to: "items#create"
  delete '/sales/:sale_id/items/:id', to: "items#destroy"
end
