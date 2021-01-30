Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'staticpages#home'
  
  resources :users
  
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :deads, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :letters, only: [:new, :create, :show, :destroy]
  end
end
