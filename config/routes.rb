Rails.application.routes.draw do
  devise_for :users, skip: :sessions, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #今回はadminなど他のスコープは使用せず、ログイン関係のパス名を変更したい為sessionsをskip（下記のscopeで定義）
    
  devise_scope :user do #ログイン関係のパス名をloginとlogoutに変更
    get "login", to: "users/sessions#new", as: :new_user_session
    post "login", to: "users/sessions#create", as: :user_session
    delete "logout", to: "users/sessions#destroy", as: :destroy_user_session
  end

  root 'products#index'
  
  resources :products, only: [:index, :new, :show, :edit]
  resources :users, only: [:show, :edit, :update] do
    member do
      get '/products/:id', to: "products#change"
      get 'logout_page'
      get 'profile_edit'
      get 'credit_add'
      get 'credit_edit'
      get 'confirmation_edit'
      get 'myaddress_edit'
      get 'mail_pass_edit'
      get 'tel_edit'
    end
  end
  
  resources :signup, only: [:create] do 
    collection do
      get 'new'
      get 'user_registration1'
      get 'user_registration2'
      get 'user_registration3'
      get 'user_registration4'
      get 'user_registration5'
      get 'done'
    end
  end
  delete 'products/:id' , to: 'products#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end