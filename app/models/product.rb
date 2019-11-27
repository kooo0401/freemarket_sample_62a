class Product < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  

  belongs_to :category
  belongs_to :brand
  belongs_to :status
  belongs_to :user
  belongs_to :size

  validates :name,        length: { maximum: 40 }, presence: true
  validates :description,     length: { maximum: 1000 }, presence: true
  validates :delivery_charged, presence: true
  validates :area, presence: true
  validates :delivery_days, presence: true
  validates :sales_status, presence: true
  validates :delivery_way, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
  
  validates :size_id, presence: true
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


end


