Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "calenders#index"
  resources :calenders
  resources :users, only: [:edit, :update]
end
