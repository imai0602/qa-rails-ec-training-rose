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
    if order.order_details.blank? # order_detailが０個の場合は、order自体を削除する
      order.destroy! # order自体を削除
    end
    flash[:success] = "準備中の注文をキャンセルしました。"
    redirect_to orders_path
  end
end
