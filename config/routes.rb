Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :events, only: [:show]
  get "/events/:id/toggle_attend", to: "events#toggle_attend", as: "toggle_attend"

  resources :venues, only: [:create, :new]
end
