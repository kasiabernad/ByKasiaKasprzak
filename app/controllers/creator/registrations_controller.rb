class Creator::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

    protected
    
    # my custom fields are :name, :heard_how
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :street_address, :city, :zip, :shipping_street_address, :shipping_city, :shipping_zip)
      end
    end
end