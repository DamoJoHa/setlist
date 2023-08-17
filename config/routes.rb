Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :events, only: [:show]
  resources :venues, only: [:create, :new]
end
