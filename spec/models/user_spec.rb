require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

  # 文字が入っているかどうかテスト
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    it "is invalid without a tel" do
      user = build(:user, tel: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step2)
    end

    it "is invalid without a zip" do
      user = build(:user, zip: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step3)
     end

    it "is invalid without a prefecture" do
      user = build(:user, prefecture: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step3)
    end

    it "is invalid without a city_name" do
      user = build(:user, city_name: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step3)
    end

    it "is invalid without a block_name" do
      user = build(:user, block_name: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step3)
    end

    it "is invalid without a bill_name" do
      user = build(:user, bill_name: nil)
      user.valid?
      expect(user).to be_invalid(:validates_step3)
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
      expect(user).to be_invalid(:validates_step1)
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
      expect(user).to be_invalid(:validates_step1)
    end

    # パスワード
    # 6文字以下なら不適切
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "a2345")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
    end

    # 7文字以上に設定してください
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    # 255文字以内に設定してください
    it "is valid with a password that has less than 255 characters " do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa")#255文字
      user.valid?
      expect(user).to be_valid
    end

    # 256文字以上なら不適切    
    it "is invalid with a password that has more than 256 characters " do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa1")#256文字
      user.valid?
      expect(user.errors[:password][0]).to include("は255文字以下に設定して下さい。")
    end

    # パスワードに英字と数字が含まれているか
    it "is valid with a password that Contains letters and numbers " do
      user = build(:user, password: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    # 数字のみのため不適切
    it "is invalid with a password except for numbers" do
      user = build(:user, password: "1111111111")
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # 英字のみのため不適切
    it "is invalid with a password except for alphabets" do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # パスワードに記号を入れても登録できる
    it "is valid with a password that Contains letters and numbers and symbol " do
      user = build(:user, password: "a123456!@#$%^&*)(=_-")
      user.valid?
      expect(user).to be_valid
    end

    # last_name
    # last_nameが20文字以下なら適切
    it "is valid with a last_name that has less than 20 characters " do
      user = build(:user, last_name: "やややややややややややややややややややや") # 20文字
      expect(user).to be_valid
    end

    # last_nameが21文字以上なら不適切
    it "is invalid with a last_name that has more than 21 characters" do
      user = build(:user, last_name: "aaaaaaaaaaaaaaaaaaaaa") # 21文字
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # first_name
    # first_nameが20文字以下なら適切
    it "is valid with a first_name that has less than 20 characters " do
      user = build(:user, first_name: "やややややややややややややややややややや") # 20文字
      expect(user).to be_valid
    end

    # first_nameが21文字以上なら不適切
    it "is invalid with a first_name that has more than 21 characters" do
      user = build(:user, first_name: "aaaaaaaaaaaaaaaaaaaaa") # 21文字
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # last_name_kana
    # 35文字以下に設定してください
    it "is invalid with a last_name_kana that has more than 36 characters " do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア") # 36文字
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # ひらがななら不適切
    it "is invalid with a last_name_kana that katakana " do
      user = build(:user, last_name_kana: "あ")
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # first_name_kana
    # 35文字以下に設定してください
    it "is invalid with a first_name_kana that has more than 36 characters " do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア") # 36文字
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # ひらがななら不適切
    it "is invalid with a first_name_kana that katakana " do
      user = build(:user, first_name_kana: "あ")
      user.valid?
      expect(user).to be_invalid(:validates_step1)
    end

    # tel
    it "is valid with a tel that Phone number format " do
      user = build(:user, tel: "08012345678")
      user.valid?
      expect(user).to be_valid
    end

    # 電話番号の形式が不適切でないか
    it "is invalid with a tel that Phone number format " do
      user = build(:user, tel: "a8012345678")
      user.valid?
      expect(user).to be_invalid(:validates_step2)
    end

    # 郵便番号が不適切な形式になっていないか
    it "is invalid with a zip that Postal code format " do
      user = build(:user, zip: "a00-0000")
      user.valid?
      expect(user).to be_invalid(:validates_step3)
    end
  end
end