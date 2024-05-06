class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.genre_id = 1
   if @item.save!
    redirect_to admin_item_path(@item)
   else
    redirect_to root_path
   end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path(@item)
    end
  end

  def index
    @items = Item.all
    @item = Item.new
  end

  def show
     @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  # 投稿データのストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id)
  end
end
