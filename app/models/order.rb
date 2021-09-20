class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  mount_uploader :image, ImageUploader

  def shipment_prepared?
    order_details.any? {|order_detail| order_detail.shipment_status.shipment_status_name == "準備中" }
  end

  def total_price
    order_details.sum(&:sub_total_price)
  end
end
