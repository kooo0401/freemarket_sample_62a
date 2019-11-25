class RemoveMoneyFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :money, :integer
  end

  def down
    add_column :users, :money, :integer
  end
end
