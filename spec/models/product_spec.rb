require 'rails_helper'

describe Product do
  describe '#create' do
    it 'is valid with a description, name, price, delivery_charged, area, 
        delivery_days, sales_status, delivery_way, user_id, category_id, size_id, status_id' do
      product = build(:product)
      expect(product).to be_valid
    end

  # 各項目入力されているかどうかのテスト
    # name
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
  
    # description
    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    # price
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    # delivery_charged
    it "is invalid without a delivery_charged" do
      product = build(:product, delivery_charged: nil)
      product.valid?
      expect(product.errors[:delivery_charged]).to include("を入力してください")
    end

    # area
    it "is invalid without area" do
      product = build(:product, area: nil)
      product.valid?
      expect(product.errors[:area]).to include("を入力してください")
    end

    # delivery_days
    it "is invalid without delivery_days" do
      product = build(:product, delivery_days: nil)
      product.valid?
      expect(product.errors[:delivery_days]).to include("を入力してください")
    end

    # sales_status
    it "is invalid without a sales_status" do
      product = build(:product, sales_status: nil)
      product.valid?
      expect(product.errors[:sales_status]).to include("を入力してください")
    end

    # delivery_way
    it "is invalid without a delivery_way" do
      product = build(:product, delivery_way: nil)
      product.valid?
      expect(product.errors[:delivery_way]).to include("を入力してください")
    end

    # category_id
    it "is invalid without category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    # # brand_id
    # it "is invalid without brand_id" do
    #   product = build(:product, brand_id: nil)
    #   product.valid?
    #   expect(product.errors[:brand_id]).to include("を入力してください")
    # end

    # size_id
    it "is invalid without a size_id" do
      product = build(:product, size_id: nil)
      product.valid?
      expect(product.errors[:size_id]).to include("を入力してください")
    end

    # name
    # nameが40文字以下なら登録できる
    it "is valid with a name that has less than 40 characters " do
      product = build(:product, name: "やややややややややややややややややややややややややややややややややややややややや") # 40文字
      expect(product).to be_valid
    end

    # nameが40文字超過なら不適切
    it "is invalid with a name that has more than 41 characters" do
      product = build(:product, name: "ややややややややややややややややややややややややややややややややややややややややや") # 41文字
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end

    # description
    # descriptionが1000文字以下なら登録できる
    it "is valid with a description that has less than 1000 characters " do
      product = build(:product, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") # 1000文字
      expect(product).to be_valid
    end

    # descriptionが1000文字超過なら不適切
    it "is invalid with a description that has more than 1001 characters" do
      product = build(:product, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") # 1001文字
      product.valid?
      expect(product.errors[:description]).to include("は1000文字以内で入力してください")
    end

    # price
    # 値が300未満なら不適切
    it "is invalid with a price that is less than 300 " do
      product = build(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

    # 300以上に設定してください
    it "is valid with a price that is more than 300 " do
      product = build(:product, price: "301")
      product.valid?
      expect(product).to be_valid
    end

    # 値を9999999以下に設定してください
    it "is valid with a price that is less than 9999999 " do
      product = build(:product, price: "9999999")
      product.valid?
      expect(product).to be_valid
    end

    # 10000000以上なら不適切    
    it "is invalid with a price is more than 10000000 " do
      product = build(:product, price: "10000001")
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

  end
end
# ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝髙橋ここまで＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝