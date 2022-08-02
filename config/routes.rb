Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#splash"

  # get '/public_recipes', to: "recipes#all", as: :home
  # resources :foods
  # resources :recipes, only: [:index, :show, :new, :create, :destroy] do
  #   resources :recipe_foods, only: [:create, :destroy]
  # end
  # resources :general_shopping_list, only: [:index]
end
