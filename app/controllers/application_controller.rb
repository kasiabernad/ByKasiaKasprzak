class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  helper_method :current_order
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def current_order
      if !session[:order_id].nil?
        Order.find(session[:order_id])
      else
        Order.new(:user_id => current_user.id)
      end
  end
  
  
  protected  
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end
    
end
