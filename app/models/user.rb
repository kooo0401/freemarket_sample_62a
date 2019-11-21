class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable
  has_many :products, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  # has_many :histories, dependent: :destroy
  # has_one  :credit, dependent: :destroy
  # has_one  :address, dependent: :destroy


  # 以下、Oauth用メソッドです。1メールアドレス(=1userレコード)に複数のsns_credentialがつくことを許容する流れを仮定しています。by平野
  # -------------------------------------------------------------------------------------------
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    sns_credential_record = SnsCredential.where(provider: auth.provider, uid: auth.uid)
    if user.present?
      unless sns_credential_record.present?
        SnsCredential.create(
          user_id: user.id,
          provider: auth.provider,
          uid: auth.uid
        )
      end
    elsif
      user = User.new(
        id: User.all.last.id + 1,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        nickname: auth.info.name,
      )
      SnsCredential.new(
        provider: auth.provider,
        uid: auth.uid,
        user_id: user.id
      )
    end 
  user
  end
  # -------------------------------------------------------------------------------------------


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,255}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTAL_CODE = /\A\d{3}-?\d{4}\z/

  # user_registration1入力項目
  validates :nickname, presence: true, length: { maximum: 20 }, on: :validates_step1
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'は有効でありません。' }, on: :validates_step1
  # validates :password, presence: true, length: { in: 7..255 }, format: { with: VALID_PASSWORD_REGEX, message: 'は255文字以下に設定して下さい'}, on: :validates_step1
  # validates :password_confirmation, presence: true, length: { in: 7..255 }, format: { with: VALID_PASSWORD_REGEX, message: 'は255文字以下に設定して下さい'}, on: :validates_step1
  validates :birthday, presence: true, on: :validates_step1
  validates :last_name, presence: true, length: { maximum: 20 }, on: :validates_step1
  validates :first_name, presence: true, length: { maximum: 20 }, on: :validates_step1
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}, on: :validates_step1
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}, on: :validates_step1

  # user_registration2入力項目
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません。'}, on: :validates_step2

  # user_registration3入力項目
  validates :zip, length: { maximum: 8 }, format: { with: VALID_POSTAL_CODE, message: 'は有効でありません。' }, on: :validates_step3
  validates :city_name, length: { maximum: 50 }, on: :validates_step3
  validates :block_name, length: { maximum: 100 }, on: :validates_step3
  validates :bill_name, length: { maximum: 100 }, on: :validates_step3


end
