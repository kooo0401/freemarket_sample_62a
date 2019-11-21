class CreateMyaddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :myaddresses do |t|
      t.string :last_name,          null: false
      t.string :first_name,         null: false
      t.string :last_name_kana,     null: false
      t.string :first_name_kana,    null: false
      t.string :zip,                null: false
      t.string :prefecture,         null: false
      t.string :city_name,          null: false
      t.string :block_name,         null: false
      t.string :bill_name
      t.integer :tel
      t.references :user,            null:false, foreign_key: true
      t.timestamps
    end
  end
end