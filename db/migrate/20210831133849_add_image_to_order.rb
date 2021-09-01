class AddImageToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :image, :string
  end
end
