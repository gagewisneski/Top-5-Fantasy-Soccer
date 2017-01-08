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

  resources :leagues

  resources :users_fixtures_selections

  resources :users_leagues

  get "/top-5/update-scores", to: "users_fixtures_selections#edit_all_scores"
  post "/top-5/update-scores", to: "users_fixtures_selections#update_all_scores"
end
