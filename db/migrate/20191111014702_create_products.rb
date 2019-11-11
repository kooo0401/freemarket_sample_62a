class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :description,               null: false
      t.string :name,                    null: false
      t.integer :price,                  null: false
      t.string :delivery_charged,        null: false
      t.string :area,                    null: false
      t.string :delivery_days,           null: false
      t.integer :seles_status,           null: false
      t.integer :delivery_way,           null: false
      t.references :user,                foreign_key: true
      t.timestamps
    end
  end
end
