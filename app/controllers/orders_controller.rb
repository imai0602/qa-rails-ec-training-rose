class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(15).order(id: :DESC)
    page = (params[:page] || 1).to_i
    par_page = 15
    @page_adj = (page - 1) * par_page + 1 # ページネーション機能の２ページ目以降のNo.調整
  end
end
