class ChangeDataDeliverydaysToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :delivery_days, :integer
    change_column :products, :delivery_charged, :integer
  end
end
