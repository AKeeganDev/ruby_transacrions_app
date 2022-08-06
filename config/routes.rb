Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/home' => 'users#splash', as: :splash
  root "groups#index"
  resources :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :groups do
    resources :expenses
  end
  get '/users/signed_out' => 'users#signed_out'
  # resources :recipes, only: [:index, :show, :new, :create, :destroy] do
  #   resources :recipe_foods, only: [:create, :destroy]
  # end
  # resources :general_shopping_list, only: [:index]
end
