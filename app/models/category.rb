class Category < ApplicationRecord
  has_ancestry
  # 以下の記述が、外部キー制約をしており、テーブルの改変に伴い、アソシエーションを除外しましたby平野
  # has_many :sizes
end

