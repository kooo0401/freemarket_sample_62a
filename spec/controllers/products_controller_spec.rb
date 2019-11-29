# require 'rails_helper'

describe ProductsController do
  describe 'delete #destroy' do
    it "deletes the products" do
      product = create(:product)
      expect{
        delete :destroy, params: { id: product.id }
      }.to change(Product,:count).by(-1)
    end
  end

  describe 'PATCH #update' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product, name: "Same Old Name")
      # @image = Image.create(product_id: "1", image: "mercari-logo.png"
    end
    
    it "update the prpduct name" do
      sign_in @user
      product_params = FactoryBot.attributes_for(:product, name: "New Name")
      patch :update, params: { id: "1", product: product_params }
      expect(@product.reload.name).not_to eq "Same Old Name"
    end
    
  end

# describe ProductsController do
#   describe 'delete #destroy' do
#     it "deletes the products" do
#       product = create(:product)
#       expect{
#         delete :destroy, params: { id: product.id }
#       }.to change(Product,:count).by(0)
#     end
#   end
# end

# describe ProductsController do
#   describe 'GET #index' do
#     it 'assigns the requested product to @product' do
#       products = create_list(:product, 10)
#       get :index
#       expect(assigns(:products)).to match(products.sort{|a, b| b <=> a})
#     end
#   end
# end
  
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


#   以下、出品ページの登録時に実装する
# describe ProductsController do
#   describe 'GET #new' do
#     it 'render product registraion page' do
#       get :new
#       expect(response).to render_template :new
#     end
#   end
# end

  # =========#create ここから髙橋記述===============
# describe ProductsController do
#   describe "#create" do
#     let(:user) {create(:user)}
#     context "as a user login" do
#       before do
#         login user
#         #「product_params」をPOSTで送信する
#         product_params = FactoryBot.attributes_for(:product)
#         post :create, params: {product:product_params }
#       end
#       # ルートパスにリダイレクトすること
#       it "redirects to the root page" do
#         # ルートパスに遷移することを確認
#         expect(response).to be_successful
#       end
#     end
#   end
# end
#  ===============ここまで髙橋記述===============

#   以下、showのパスにidが入るように変更したのち追加（show/:id?)
#   村上さん作成の下記を,一旦コメントアウトしてます!!   191121 (髙橋)
# describe ProductsController do
#   describe 'GET #show' do
#     it "assigns the requested product to @product" do
#       product = build(:product)
#       get :show, params: { id: 1 }
#       expect(assigns(:product)).to eq product
#     end
#   end
# end

# describe ProductsController do
#     it 'render show page' do
#       get :show, params: { id: 1 }
#       expect(response).to render_template :show
#     end
# end
  

  # 以下、edit(purchese)のパスを作ったのち実装、但しまずパスの書き方を考える必要あり
#   describe ProductsController do
#   descibe 'GET #edit' do
#     it 'render pruduct purchase page' do
#       get :edit+??? params { id:1 }
#     end
#   end
# end

