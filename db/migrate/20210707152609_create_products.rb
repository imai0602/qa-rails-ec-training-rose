class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, limit: 64
      t.integer :category_id
      t.integer :price
      t.string :description
      t.integer :sale_status_id
      t.integer :product_status_id
      t.timestamp :regist_date
      # t.references :user, null: false, foreign_key: true
      t.string :delete_flag, limit: 1


      t.timestamps
    end
  end
end
