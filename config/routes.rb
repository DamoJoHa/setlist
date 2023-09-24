Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  get "/profile", to: "pages#profile", as: "profile"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, only: [:show]
  get "/acts/:id/add_favorite", to: "acts#add_favorite", as: "add_favorite_act"
  get "/acts/:id/remove_favorite", to: "acts#remove_favorite", as: "remove_favorite_act"

  resources :acts, only: [:show]
  get "/events/:id/add_attend", to: "events#add_attend", as: "add_attend"
  get "/events/:id/remove_attend", to: "events#remove_attend", as: "remove_attend"

  resources :venues, only: [:create, :new, :show]
  get "/venues/:id/add_favorite", to: "venues#add_favorite", as: "add_favorite_venue"
  get "/venues/:id/remove_favorite", to: "venues#remove_favorite", as: "remove_favorite_venue"
end
