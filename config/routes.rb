Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # config/routes.rb

# Route for listing all user posts
get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

# Route for showing a specific user post
get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

# Route for listing all users
get '/users', to: 'users#index'

# Route for showing a specific user
get '/users/:id', to: 'users#show', as: 'user'

end
