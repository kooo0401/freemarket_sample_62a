class AddStatusIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status_id, :BIGINT, default:1
  end
end
