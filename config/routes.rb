Garage::Application.routes.draw do
  root 'pages#landing_page'  

  devise_for :users
  resources :sales
  resources :pages

  get '/landing_page', to: 'pages#landing_page', as: :landing_page
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/my_sales', to: 'pages#user_sales', as: :my_sales
  get '/my_items', to: 'pages#user_items', as: :my_items
  get '/my_transactions', to: 'pages#user_transactions', as: :my_transactions

  post '/sales/:sale_id/items', to: "items#create", as: :item_create
  delete '/sales/:sale_id/items/:id', to: "items#destroy", as: :item
end
