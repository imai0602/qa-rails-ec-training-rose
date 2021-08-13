class OrdersController < ApplicationController
  before_action :correct_user, { only: [:show] }

  def show
    @order = Order.find_by(id: params[:id])
  end
end
