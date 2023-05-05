Rails.application.routes.draw do
  get 'details/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "login#log"

  post 'login/login'
  get 'create/index'
  post 'create/create'
  get 'logged/index'
  get 'logged/logout'
  get 'logged/getRessources'
  get 'logged/getTypeRessources'
  post 'details/index'
end
