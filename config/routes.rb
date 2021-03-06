Rails.application.routes.draw do
  resources :users
  mount Hyperstack::Engine => '/hyperstack'  # this route should be first in the routes file so it always matches
  get '/(*other)', to: 'hyperstack#app'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
