class ProductStatuse < ApplicationRecord
  has_many :products, dependent: :destroy
end
