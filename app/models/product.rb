class Product < ApplicationRecord
  has_many :images , dependent: :destroy
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

end


