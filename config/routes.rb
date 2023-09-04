Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :events, only: [:show]
  resources :acts, only: [:show]
  get "/events/:id/add_attend", to: "events#add_attend", as: "add_attend"
  get "/events/:id/remove_attend", to: "events#remove_attend", as: "remove_attend"

  resources :venues, only: [:create, :new]
end
