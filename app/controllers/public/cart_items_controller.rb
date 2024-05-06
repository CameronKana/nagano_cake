class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @cart_items =current_customer.cart_items
    @cart_item = CartItem.new
    @sum = 0

    #byebug
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @item = Item.find(params[:cart_item][:item_id])
    if @cart_item
      new_amount = @cart_item.amount + cart_items_params[:amount].to_i
    @cart_item.update(amount: new_amount)
    redirect_to cart_items_path
    else
      @cart_item = current_customer.cart_items.new(cart_items_params)
      @cart_item.item_id = @item.id
      if @cart_item.save!
        redirect_to cart_items_path
      else
        render 'public/items/show'
      end
    end
  end

  def update
    cart_items = CartItem.find(params[:id])  # データ（レコード）を1件取得
    cart_items.update(cart_items_params)
    redirect_to cart_items_path
  end


  def destroy
    cart_items = CartItem.find(params[:id])  # データ（レコード）を1件取得
    cart_items.destroy  # データ（レコード）を削除
    redirect_to '/cart_items'  # 投稿一覧画面へリダイレクト
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to '/cart_items'  # 投稿一覧画面へリダイレクト
  end
# 投稿データのストロングパラメータ
  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end



end
