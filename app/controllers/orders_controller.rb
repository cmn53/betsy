class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.cart_id = session[:cart_id]

    if @order.save

      flash[:status] = :success
      flash[:result_text] = "Your order has been placed !"
      flash[:order_number] = "Order number: #{@order.id}"
      session[:cart_id] = nil
      redirect_to order_path(@order)
    else

      flash.now[:status] = :failure
      flash.now[:result_text] = "Could not place your order"
      flash.now[:messages] = @order.errors.messages

      render :new, status: :bad_request
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    head :not_found unless @order
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :creditcard, :name_on_card, :expiration_month, :expiration_year, :cvv, :mail_address, :billing_address, :zipcode, :status)
  end

end
