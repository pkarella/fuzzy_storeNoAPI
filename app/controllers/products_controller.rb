class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    if current_order
      @order_item = current_order.order_items.new
    end
  end
  def show
    @product = Product.find(params[:id])
    if @product.reviews.any?
      @reviews = @product.reviews.all
    end
    if current_user
      @user_purchase = current_user.bought
    end
  end
end
