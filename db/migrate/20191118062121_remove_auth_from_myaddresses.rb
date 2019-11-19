class RemoveAuthFromMyaddresses < ActiveRecord::Migration[5.2]
  def up
    remove_column :myaddresses, :tel, :integer
  end

  def down
    add_column :myaddresses, :tel, :integer
  end
end
