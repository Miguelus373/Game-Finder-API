Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show create]

  resources :games, only: %i[index show]

  resources :favourites, only: %i[create destroy]

  post '/login', to: 'authentication#login'
end
