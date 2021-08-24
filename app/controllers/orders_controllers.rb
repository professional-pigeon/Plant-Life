class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      flash[:success] = t('flash.order.success')
      redirect_to root_path
    else
      flash.now[:error] = t('flash.order.error_html')
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone, :message)
  end
end