require 'rails_helper'

describe ProductsController do
  
  describe 'GET #index' do
    it 'assigns the requested product to @product' do
      products = create_list(:product, 10)
      get :index
      expect(assigns(:products)).to match(products.sort{|a, b| b <=> a})
    end
  
    it 'render top page' do
      get :index
      expect(response).to render_template :index
    end
  end


  # 以下、出品ページの登録時に実装する
  # describe 'GET #new' do
  #   it 'render product registraion pade' do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  # end

  # 以下、showのパスにidが入るように変更したのち追加（show/:id?)
  describe 'GET #show' do
    
    it "assigns the requested product to @product" do
      product = build(:product)
      get :show, params: { id: 1 }
      expect(assigns(:product)).to eq product
    end

    it 'render show page' do
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end
  end

  # 以下、edit(purchese)のパスを作ったのち実装、但しまずパスの書き方を考える必要あり
  # descibe 'GET #edit' do
  #   it 'render pruduct purchase page' do
  #     get :edit+???, params { id:1 }
  #   end
  # end





end