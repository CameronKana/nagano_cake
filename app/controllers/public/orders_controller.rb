class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def new
    @order = Order.new
    @customer = current_customer
  end

  # 投稿データの保存
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.quantity = cart_item.amount
      @order_details.making_status = 0
      @order_details.save
    end

     CartItem.destroy_all


    redirect_to  orders_thanks_path

  end


  def index
    @orders = current_customer.orders
  end

  def show
    # @order = current_customer.orders.find(params[:id])
    @order = Order.find(params[:id])
    @orders = Order.all
    @customer = @order.customer
    @order_items = @order.order_details.all
    @order_details = @order.order_details
  end

  def confirm
  @order = Order.new(order_params)
  @cart_items = current_customer.cart_items
  # @order.post_code = @address.postal_code
  # @order.address = @address.address
  # @order.name = @address.name
  @order.shipping_fee = 800
  @total = 0

  if (params[:order][:select_address]).to_i==0
        @order.post_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name =  current_customer.first_name + current_customer.last_name

  elsif (params[:order][:select_address]).to_i==1
        @address = Address.find(params[:order][:address_id])
        @order.post_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name

  elsif (params[:order][:select_address]).to_i==2
  end

  end

  def thanks
  end

  # 投稿データのストロングパラメータ
  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_price, :shipping_fee, :status)
  end

end
