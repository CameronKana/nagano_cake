class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @customer = @order.customer
    @order_items = @order.order_details.all
    @order_details = @order.order_details
    #byebug
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private
    def order_params
    params.require(:order).permit(:status)
    end


end
