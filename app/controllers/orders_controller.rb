class OrdersController < ApplicationController
  before_action :correct_user, only: :show

  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(15).order(order_date: :DESC)
  end

  def create # rubocop:disable Metrics/AbcSize
    if session[:cart].blank?
      return redirect_to carts_show_path
    end

    cart = session[:cart]

    order = current_user.orders.create!(
      order_date: Time.current,
      order_number: "#{cart.object_id % 100}#{complex_data}",
    )

    session[:cart].each do |c|
      order.order_details.create(
        product_id: c["product_id"],
        shipment_status_id: 1,
        order_detail_number: "#{c["product_id"]}#{complex_data}".rjust(16, "0"),
        order_quantity: c["quantity"],
      )
    end

    session[:cart].clear
    redirect_to perchase_completed_path(order.id)
  end

  def perchase_completed
    @order = Order.find_by(id: params[:id])
  end

  private

    def complex_data
      Time.current.strftime("%y%m%d%H%M").to_i
    end
end
