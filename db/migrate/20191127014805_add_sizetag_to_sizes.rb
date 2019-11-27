class AddSizetagToSizes < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :size_tag, :integer
  end
end
