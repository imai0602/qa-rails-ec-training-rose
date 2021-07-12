class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :shipment_status
  belongs_to :product
end
