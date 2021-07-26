module ApplicationHelper
  def shipment_prepared?
    @order.order_details.any? {|order_detail| order_detail.shipment_status.shipment_status_name == "準備中" }
  end

  def total_price
    total_price = 0
    @order.order_details.each do |order_detail|
      total_price += order_detail.sub_total_price
    end
    total_price
  end
end
