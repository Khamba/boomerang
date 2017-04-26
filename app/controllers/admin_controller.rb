class AdminController < ApplicationController

  def dashboard
    @processing_orders = Order.where(status: 'processing').page(params[:processing])
    @delivered_orders = Order.where(status: 'delivered').page(params[:delivered])
    @collected_orders = Order.where(status: 'collected').page(params[:collected])
  end

end
