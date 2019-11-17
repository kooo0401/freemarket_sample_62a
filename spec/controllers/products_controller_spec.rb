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
  #   it 'render product registraion page' do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  # end

  # ===============ここから髙橋記述===============
  describe Product do
    describe '#create' do
      it 'is valid with a description, name, price, delivery_charged, area, 
          delovery_days, sales_status, delivery_way, user_id, category_id, brand_id, size_id, status_id' do
        product = build(:product)
        expect(product).to be_valid
      end
    

    # 各項目入力されているかどうかのテスト
      it "is invalid without a description" do
        product = build(:product, description: nil)
        product.valid?
        expect(product.errors[:description]).to include("can't be blank")
      end
    

      it "is invalid without a name" do
        product = build(:product, name: nil)
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end

      it "is invalid without a price" do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "is invalid without a delivery_charged" do
        product = build(:product, delivery_charged: nil)
        product.valid?
        expect(product.errors[:]).to include("can't be blank")
      end

      it "is invalid without a area" do
        product = build(:product, area: nil)
        product.valid?
        expect(product.errors[:area]).to include("can't be blank")
      end

      it "is invalid without delicery_" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("が入力されていません。")
      end

      # it "is invalid without a tel" do
      #   user = build(:user, tel: nil)
      #   user.valid?
      #   expect(user.errors[:tel]).to include("が入力されていません。")
      # end

      # it "is invalid without a zip" do
      #   user = build(:user, zip: nil)
      #   user.valid?
      #   expect(user.errors[:zip]).to include("が入力されていません。")
      # end

      # it "is invalid without a prefecture" do
      #   user = build(:user, prefecture: nil)
      #   user.valid?
      #   expect(user.errors[:prefecture]).to include("が入力されていません。")
      # end

      # it "is invalid without a city_name" do
      #   user = build(:user, city_name: nil)
      #   user.valid?
      #   expect(user.errors[:city_name]).to include("が入力されていません。")
      # end

      # it "is invalid without a block_name" do
      #   user = build(:user, block_name: nil)
      #   user.valid?
      #   expect(user.errors[:block_name]).to include("が入力されていません。")
      # end

      # it "is invalid without a bill_name" do
      #   user = build(:user, bill_name: nil)
      #   user.valid?
      #   expect(user.errors[:bill_name]).to include("が入力されていません。")
      # end
    end
  end
end
# ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝髙橋ここまで＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


  # 以下、showのパスにidが入るように変更したのち追加（show/:id?)
  # describe 'GET #show' do
  #   it 'render product detail page' do
  #     get :show, params: { id:1 }
  #   end
  # end

  # 以下、edit(purchese)のパスを作ったのち実装、但しまずパスの書き方を考える必要あり
  # descibe 'GET #edit' do
  #   it 'render pruduct purchase page' do
  #     get :edit+???, params { id:1 }
  #   end
  # end



 