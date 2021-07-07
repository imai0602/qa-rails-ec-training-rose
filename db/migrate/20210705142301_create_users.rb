class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :password, :limit => 64
      t.string :last_name, :limit => 16
      t.string :first_name, :limit => 16
      t.string :zipcode, :limit => 16
      t.string :prefecture, :limit => 16
      t.string :municipality, :limit => 16
      t.string :address, :limit => 32
      t.string :apartments, :limit => 32
      t.string :email, :limit => 128
      t.string :phone_number, :limit => 16
      t.string :company_name, :limit => 128
      t.string :delete_flag, :limit => 1

      t.timestamps
    end
  end
end
