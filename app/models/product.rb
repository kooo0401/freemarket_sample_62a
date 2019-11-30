class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
 
  has_many :images , dependent: :destroy
  accepts_nested_attributes_for :images

 
  

  belongs_to :category
  # DB変更に伴い、brandを削除してます 191128 髙橋
  # belongs_to :brand
  belongs_to :status
  belongs_to :user


  validates :name,        length: { maximum: 40 }, presence: true
  validates :description,     length: { maximum: 1000 }, presence: true
  validates :delivery_charged, presence: true
  validates :delivery_days, presence: true
  validates :sales_status, presence: true
  validates :delivery_way, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true

  validates :price, presence: true, numericality: { only_integr: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  enum sales_status:{
    '---':           0, #---
    unused:          1, #新品、未使用
    nearly_unused:   2, #未使用に近い
    not_injured:     3, #目立った傷や汚れなし
    bit_injured:     4, #やや傷や汚れあり
    injured:         5, #傷や汚れあり
    bad:             6,  #全体的に状態が悪い
  },_prefix: true

  enum delivery_charged:{
    '---':                      0,  #---
    shipping_fee_on_shipper:    1,  #送料込み（出品者負担）
    shipping_fee_on_receiver:   2,  #着払い（購入者負担）
  },_prefix: true

  enum delivery_way:{
    '---':                  0, #---
    kuroneko_yamato:        1, #クロネコヤマト
    yu_pack:                2, #ゆうパック
    yu_mail:                3, #ゆうメール
    rakuraku_mercari_bin:   10, #らくらくメルカリ便
    letter_pack:            11, #レターパック
    normal:                 12, #普通郵便（定型、定型外）
    clickpost:              13, #クリックポスト
  },_prefix: true

  enum delivery_days:{
    '---':      0,  #---
    days1_2:    1,  #1日~2日で発送
    days2_3:    2,  #2日~3日で発送
    days4_7:    3,  #4日~7日で発送
  },_prefix: true

end


