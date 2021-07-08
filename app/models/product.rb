class Product < ApplicationRecord
  # belongs_to :user
  # has_many :order_detail
  has_many :purchases
  belongs_to :categories
  belongs_to :sale_statuses
  belongs_to :product_statuses
end
