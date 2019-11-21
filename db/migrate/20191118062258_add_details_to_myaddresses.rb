class AddDetailsToMyaddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :myaddresses, :tel, :string
  end
end
