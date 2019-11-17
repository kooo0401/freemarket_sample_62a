class RemoveNameFromUsers < ActiveRecord::Migration[5.2]

  def up
    remove_column :users, :name
    remove_column :users, :name_kana
  end

  def down
    add_column :users, :name, :string
    add_column :users, :name_kana, :string
  end
end
