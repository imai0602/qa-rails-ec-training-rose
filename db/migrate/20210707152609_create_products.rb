class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, limit: 64
      t.references :category, null: false, foreign_key: true
      t.integer :price
      t.string :description, limit: 256
      t.references :sale_status, null: false, foreign_key: true
      t.references :product_status, null: false, foreign_key: true
      t.timestamp :regist_date
      t.references :user, null: false, foreign_key: true
      t.boolean :delete_flag, limit: 1

      t.timestamps
    end
  end
end
