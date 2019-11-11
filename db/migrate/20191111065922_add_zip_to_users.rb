class AddZipToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :zip, :integer
    add_column :users, :prefecture, :string
    add_column :users, :city_name, :string
    add_column :users, :block_name, :string
    add_column :users, :bill_name, :string
  end
end
