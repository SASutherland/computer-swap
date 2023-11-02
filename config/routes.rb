Rails.application.routes.draw do

  # get 'dashboard/index'

  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: "dashboard#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :computers do
    resources :bookings, only: [:show, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy]
end
