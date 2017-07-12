class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!
  before_action :build_temporary_cart




    def build_temporary_cart
      session[:temporary_shopping_cart] = [] unless current_user
    end

  def after_sign_in_path_for(resource)
    home_index_path
  end

  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    elsif current_user && Order.in_progress(current_user)[0]
      Order.in_progress(current_user)[0]
    else
      Order.new(account_id: current_user.account.id )
    end
  end

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar, :current_password,]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
