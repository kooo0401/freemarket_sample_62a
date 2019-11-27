class RemoveSizeidFromCagtegories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :size, foreign_key: true
  end
end
