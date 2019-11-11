Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  get 'products/index'
  get 'products/new'
  get 'products/show'
  get 'products/edit'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
