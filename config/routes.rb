Rails.application.routes.draw do
  devise_for :users #今回はadminなど他のスコープは使用しない
    
  devise_scope :user do #パス名をloginとlogoutに変更（users/sign_inで飛べてしまうが）
    get "signup", to: "users/sessions#new"
    post "signup", to: "users/sessions#create"
    get "logout", to: "users/sessions#destroy"
  end

  root 'products#index'
  
  resources :products, only: [:index, :new, :show, :edit]
  resources :users, only: [:show, :edit] do
    collection do
      get :signup
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end