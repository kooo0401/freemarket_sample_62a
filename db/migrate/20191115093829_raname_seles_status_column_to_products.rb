class RanameSelesStatusColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :seles_status, :sales_status
  end
end
