class Image < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :image, ImageUploader

  
  # validate :exsitence_of_product_id

  # private
  #   def exsitence_of_product_id
  #     if Product.all.ids.exclude?(product_id)
  #       errors.add(:product_id, "入力したカードIDがUserDB上に存在しません") 
  #     end
  #   end
end
