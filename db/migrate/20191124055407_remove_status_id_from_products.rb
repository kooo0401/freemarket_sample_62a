class RemoveStatusIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :status_id, :BIGINT
  end
end
