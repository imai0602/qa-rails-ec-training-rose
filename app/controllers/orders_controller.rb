class OrdersController < ApplicationController
  before_action :correct_user, only: :show

  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(15).order(order_date: :DESC)
  end
end
