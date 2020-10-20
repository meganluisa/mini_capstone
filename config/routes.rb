Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
    get "/suppliers/:id" => "suppliers#show"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
    # post "orders/:id" => "orders#show"
    post "/carted_products" => "carted_products#create"
    get "/carted_products" => "carted_products#index"
    delete "/carted_products/:id" => "carted_products#destroy"
  end
end
