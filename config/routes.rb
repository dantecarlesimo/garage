Garage::Application.routes.draw do
  resources :sales
  devise_for :users
end
