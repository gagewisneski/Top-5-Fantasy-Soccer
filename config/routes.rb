Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "fixtures_groups#index"
  resources :fixtures_groups

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  post "/users/:id", to: "users#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/leagues/indexes", to: "leagues#indexes"
  resources :leagues

  resources :users_fixtures_selections

  resources :users_leagues

  # Admin pages
  get "/top-5/update-scores", to: "users_fixtures_selections#edit_all_scores"
  post "/top-5/update-scores", to: "users_fixtures_selections#update_all_scores"
  get "/top-5/update-locked", to: "fixtures_groups#edit_locked"
  post "/top-5/update-locked", to: "fixtures_groups#update_locked"
  get "/top-5/find", to: "fixtures_groups#find"
  post "/top-5/finder", to: "fixtures_groups#finder"
end
