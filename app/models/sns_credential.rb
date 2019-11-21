class SnsCredential < ApplicationRecord
  belongs_to :user

  validates :uid, uniqueness: true
end
