class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status
end
