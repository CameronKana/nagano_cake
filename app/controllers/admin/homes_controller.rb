class Admin::HomesController < ApplicationController
   before_action :authenticate_admin!

def top
  @home = Home.new
  @homes = Home.all
#   @customer = Customer.find(params[:id])
  @orders = Order.all
end
end

