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

end
