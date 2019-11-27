class AddColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :size_tag, :integer
  end
end
