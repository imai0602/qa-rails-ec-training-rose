class Product < ApplicationRecord
  belongs_to :user
  has_many :order_details
  has_many :purchases
  belongs_to :category
  belongs_to :sale_statuse
  belongs_to :product_statuse
end
