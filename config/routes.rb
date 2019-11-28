Rails.application.routes.draw do

  devise_for :users, skip: :sessions, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #今回はadminなど他のスコープは使用せず、ログイン関係のパス名を変更したい為sessionsをskip（下記のscopeで定義）
    
  devise_scope :user do #ログイン関係のパス名をloginとlogoutに変更
    get "login", to: "users/sessions#new", as: :new_user_session
    post "login", to: "users/sessions#create", as: :user_session
    delete "logout", to: "users/sessions#destroy", as: :destroy_user_session
  end

  root 'products#index'
  
  resources :products do
    resources :purchase, only: [:index] do
      collection do
        post 'pay'
        get 'done'
      end
    end  
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get '/products/:id', to: "products#change" #要検討20191125

      delete '/products/:id', to: "products#destroy"
      
      get 'logout'
      get 'profile'
      get 'credit_add'
      get 'credit_edit'
      get 'confirmation'
      get 'myaddress'
      get 'mail_pass'
      get 'tel'
      get 'myproducts_exhibiting'
      get 'myproducts_trading'
      get 'myproducts_sold'
    end
    resources :card, only: [:new] do
      collection do
        get 'show'
        post 'pay'
        post 'delete'
        get 'addition'
      end
    end
  end
  
  resources :signup, only: [:create] do 
    collection do
      get 'new'
      get 'user_registration1'
      get 'user_registration2'
      get 'user_registration3'
      get 'user_registration4'
      get 'done'
    end
  end

  namespace :api do
    resources :products, only: :create, defaults: { format: 'json'}
    resources :products2, only: :create, defaults: { format: 'json'}
    resources :products3, only: :create, defaults: { format: 'json'}
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end