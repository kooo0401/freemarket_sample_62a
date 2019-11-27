class RenameSizeidColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :size_id, :size_tag
  end
end
