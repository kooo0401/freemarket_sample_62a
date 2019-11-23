class RemoveAncestryFromCategories < ActiveRecord::Migration[5.2]

  def up
    remove_column :categories, :ancestry
  end

  def down
    add_column :categories, :ancestry, :string
  end

end
