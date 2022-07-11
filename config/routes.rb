Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"

  get "/users" => "users#index"
  get "/users/:author_id" => "posts#index", as: :user_posts
  get "/users/:author_id/posts/:id" => "posts#show", as: :user_post
  get "/users/:id" => "users#show", as: :user
end
