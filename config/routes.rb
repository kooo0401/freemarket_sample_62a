Rails.application.routes.draw do
  devise_for :users, skip: :sessions #今回はadminなど他のスコープは使用せず、ログイン関係のパス名を変更したい為sessionsをskip（下記のscopeで定義）
    
  devise_scope :user do #ログイン関係のパス名をloginとlogoutに変更
    get "login", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    delete "logout", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  root 'products#index'
  
  resources :products, only: [:index, :new, :show, :edit, :create]
  resources :users, only: [:show, :edit]

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end