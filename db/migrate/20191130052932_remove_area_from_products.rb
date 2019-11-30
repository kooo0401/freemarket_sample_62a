class RemoveAreaFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :area, :string
  end
end
