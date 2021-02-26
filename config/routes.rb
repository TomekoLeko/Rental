Rails.application.routes.draw do
  resources :due_types
  resources :dues
  resources :agreements
  resources :tenants
  devise_for :users
  resources :properties
  # get 'home/index'
  root 'dues#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
