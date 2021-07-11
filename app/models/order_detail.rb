class OrderDetail < ApplicationRecord
  belongs_to :orders, :shipment_statuses :products
end
