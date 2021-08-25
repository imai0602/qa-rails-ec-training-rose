class OrdersController < ApplicationController
  before_action :correct_user, only: :show

  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(15).order(order_date: :DESC)
  end

  def destroy
    order = current_user.orders.find_by(id: params[:id])
    order.order_details.destroy_by(shipment_status_id: 1) # 準備中のorder_detailのみを削除
    if order.order_details.count == 0 # order_detailが０個の場合は、order自体を削除する
      order.destroy! # order自体を削除
    end
    flash[:success] = "準備中の注文をキャンセルしました。"
    redirect_to orders_path
  end

  def create # rubocop:disable Metrics/AbcSize
    if session[:cart].blank?
      return redirect_to carts_show_path
    end

    #cart = session[:cart]

    order = current_user.orders.create!(
      order_date: Time.current,
      order_number: generate_order_number,
    )

    session[:cart].each do |cart|
      order.order_details.create(
        product_id: cart["product_id"],
        shipment_status_id: 1,
        order_detail_number: "1111111111111111", #使用する用途が無い為仮の番号
        order_quantity: cart["quantity"],
      )
    end

    session[:cart].clear
    redirect_to perchase_completed_path(order.id)
  end

  def perchase_completed
    @order = Order.find_by(id: params[:id])
  end

  private

    def generate_order_number
      "#{current_user.id}#{Time.current.strftime("%y%m%d%H%M").to_i}".rjust(16, "0")
    end
end
