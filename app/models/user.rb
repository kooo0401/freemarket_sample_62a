class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  # has_many :histories, dependent: :destroy
  # has_one  :credit, dependent: :destroy
  # has_one  :address, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/i

  validates :name, presence: true, length: { maximum: 20 }
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です' }
  validates :password, presence: true, length: { in: 7..255 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}  
  validates :name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :birthday, presence: true
  validates :tel, presence: true, format: { with:　VALID_PHONE_REGEX , message: 'の入力が正しくありません'}
  validates :zip, presence: true, length: { maximum: 8 }, format: { with: VALID_POSTAL_CODE, message: 'のフォーマットが不適切です' }
  validates :prefecture, presence: true
  validates :city_name, presence: true, length: { maximum: 50 }
  validates :block_name, presence: true, length: { maximum: 100 }
  validates :bill_name, presence: true, length: { maximum: 100 }
end
