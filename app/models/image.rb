class Image < ApplicationRecord
  belongs_to :product, optional: true
  # ,inverse_of: :images
  mount_uploader :image, ImageUploader
  
  # validates :image, presence: true, on: :create
end
