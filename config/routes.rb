Rails.application.routes.draw do
  root "welcome#index"

  resources :foods
  resources :users do
    resources :orders do
      post 'add_food', to: 'orders#add_food'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  post 'add_food', to: 'orders#add_food'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
