Rails.application.routes.draw do
  # http_verb '/path', to: 'controller#action', as: :prefix
  # prefixes only belong to the path (does NOT include the http_verb)

  # restaurants/new
  # CRUD routes
  root to: 'restaurants#index'
  # Read all
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Create
  # this is for the form page 👇
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # this is where the form gets sent 👇
  post '/restaurants', to: 'restaurants#create'

  # Read one
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # Update
  # this is for the form page 👇
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # this is where the form gets sent 👇
  patch '/restaurants/:id', to: 'restaurants#update'

  # Destroy
  delete '/restaurants/:id', to: 'restaurants#destroy'

  # CANT USE TODAY
  # resources :restaurants
end

# link_to '', restaurants_path, method: :post
# link_to '', restaurants_path, method: :get
