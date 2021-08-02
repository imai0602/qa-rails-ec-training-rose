class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status

  def self.search(search, category)
    products = Product.all
    products = products.where(["product_name LIKE ?", "%#{search}%"]) if search.present?
    products = products.where(category_id: category) if category.present?
    products
  end
end
