class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items

  end

  def order_complete
    current_order.update(:status => 'Processing')
    session[:order_id] = nil
    redirect_to user_path(current_user)
  end

end
