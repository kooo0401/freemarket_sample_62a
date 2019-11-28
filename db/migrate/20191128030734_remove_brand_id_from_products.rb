class RemoveBrandIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :brand, foreign_key: true
  end
end
