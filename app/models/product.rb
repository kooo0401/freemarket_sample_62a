class Product < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :brand
  belongs_to :status
  belongs_to :user
  belongs_to :size
end
