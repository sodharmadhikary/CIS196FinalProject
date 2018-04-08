Rails.application.routes.draw do
  root "welcome#index"

  resources :orders
  resources :foods
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
