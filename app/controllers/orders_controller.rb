class OrdersController < ApplicationController

  def add_to_cart
    @cart = current_user.cart
    @cart.add_item(params[:cart])
    begin
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to(product_path(params[:cart][:product_id]))
    end
  end

  def remove_from_cart
    @cart = current_user.cart
    @cart.remove_item(params[:line_item_id])
    redirect_to show_cart_path
  end

  def show_cart
    @cart = current_user.cart
  end

  def cart_checkout
    @cart = current_user.cart
    @order_shipping_address = OrderShippingAddress.new(user: current_user, order: @cart)
  end

  def place_order
    @cart = current_user.cart
    if @cart.empty?
      redirect_to root_path
    else
      @order_shipping_address = OrderShippingAddress.new(order_params.merge(user: current_user, order: @cart))
      if @order_shipping_address.save
        @cart.status = "processing"
        @cart.save
        redirect_to thank_you_path
      else
        render :cart_checkout
      end
    end
  end

  def thank_you
    @order = current_user.orders.where(status: 'processing').last
    @order_shipping_address = @order.order_shipping_address
  end

  private
    def order_params
       params.require(:order).permit(:name, :email, :phone_number, :state, :city, :address, :zip)
    end

end
