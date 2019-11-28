class Size < ApplicationRecord
  # has_many :products
  # 以下の記述が、外部キー制約をしており、テーブルの改変に伴い、アソシエーションを除外しましたby平野
  # belongs_to :category
end
