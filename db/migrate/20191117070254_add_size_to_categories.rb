class AddSizeToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :size,   foreign_key: true
  end
end
