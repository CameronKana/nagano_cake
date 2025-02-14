class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

    def edit
    # is_matching_login_user
    @customer = current_customer

    end

    def update
      @customer = current_customer
      if @customer.update(customer_params)
      redirect_to customers_my_page_path(@customer)
      end
    end


    def unsubscribe

    end




    def withdraw
      @customer = Customer.find(current_customer.id)
      # customer = current_customer
      @customer.update(is_active: false)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to   root_path

    end

    private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :telephone_number, :email)
  end

end

