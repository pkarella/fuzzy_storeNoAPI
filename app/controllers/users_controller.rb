class UsersController < ApplicationController

  def show
    @user = current_user
    @orders = current_user.account.orders
  end
end
