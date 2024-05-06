class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!


  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @addresses = Address.new(addresses_params)
    @addresses.customer_id = current_customer.id
    @addresses.save
    redirect_to addresses_path
  end

  def edit
    @address =  Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    if @addresses.update(addresses_params)
     redirect_to addresses_path(@customer)
    end
  end

  def destroy
    addresses = Address.find(params[:id])  # データ（レコード）を1件取得
    addresses.destroy  # データ（レコード）を削除
    redirect_to '/addresses'  # 投稿一覧画面へリダイレクト
  end


  private
  # ストロングパラメータ
  def addresses_params
    params.require(:address).permit(:name, :address, :postal_code, :telephone_number, :email)
  end




end
