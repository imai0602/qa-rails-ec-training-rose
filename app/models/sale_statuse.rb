class SaleStatuse < ApplicationRecord
  has_many :products, dependent: :destroy
end
