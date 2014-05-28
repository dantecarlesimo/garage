Garage::Application.routes.draw do
  devise_for :users
  resources :sales


  post '/sales/:sale_id/items', to: "items#create"
  delete '/sales/:sale_id/items/:id', to: "items#destroy"
end
