class ChangeDatatypeZipOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :zip, :string
  end
end
