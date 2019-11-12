require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a name, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

  # 文字が入っているかどうかテスト
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "is invalid without a name_kana" do
      user = build(:user, name_kana: nil)
      user.valid?
      expect(user.errors[:name_kana]).to include("が入力されていません。")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("が入力されていません。")
    end

    it "is invalid without a tel" do
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include("が入力されていません。")
    end

    it "is invalid without a zip" do
      user = build(:user, zip: nil)
      user.valid?
      expect(user.errors[:zip]).to include("が入力されていません。")
    end

    it "is invalid without a prefecture" do
      user = build(:user, prefecture: nil)
      user.valid?
      expect(user.errors[:prefecture]).to include("が入力されていません。")
    end

    it "is invalid without a city_name" do
      user = build(:user, city_name: nil)
      user.valid?
      expect(user.errors[:city_name]).to include("が入力されていません。")
    end

    it "is invalid without a block_name" do
      user = build(:user, block_name: nil)
      user.valid?
      expect(user.errors[:block_name]).to include("が入力されていません。")
    end

    it "is invalid without a bill_name" do
      user = build(:user, bill_name: nil)
      user.valid?
      expect(user.errors[:bill_name]).to include("が入力されていません。")
    end

    # name
    # nameが20文字以下なら登録できる
    it "is valid with a name that has less than 20 characters " do
      user = build(:user, name: "やややややややややややややややややややや") # 20文字
      expect(user).to be_valid
    end

    # nameが21文字以上なら不適切
    it "is invalid with a name that has more than 21 characters" do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaaaa") # 21文字
      user.valid?
      expect(user.errors[:name]).to include("は20文字以下に設定して下さい。")
    end

    # ニックネーム
    # ニックネームが20文字以下なら登録できる
    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa") # 20文字
      expect(user).to be_valid
    end

    # ニックネームが21文字以上なら不適切
    it "is invalid with a nickname that has more than 21 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa") # 21文字
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以下に設定して下さい。")
    end

    # emailのフォーマットが不適切でないか

    # 英字が入っていないから不適切
    it 'is invalid with a email wrong format' do
      user = build(:user, email: '12345678')
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end

    # ＠が最初にくると不適切
    it "is invalid with a email includes no character before @ " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は有効でありません。")
    end

    # ＠が最後にくると不適切
    it "is invalid with a email includes no character after @ " do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("は有効でありません。")
    end

    # 英数字以外が入ると不適切
    it "is invalid with a email includes non-alphanumeric characters " do
      user = build(:user, email: "aaあa@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は有効でありません。")
    end

    # パスワード
    # 6文字以下なら不適切
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "a2345", password_confirmation: "a2345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end

  end
end