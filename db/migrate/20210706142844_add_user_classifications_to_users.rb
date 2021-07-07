class AddUserClassificationsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :user_classification, null: false, foreign_key: true
  end
end
