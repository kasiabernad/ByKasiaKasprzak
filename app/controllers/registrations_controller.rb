class RegistrationsController < Devise::RegistrationsController
  private
  
  def sign_up_params
      allow = [:email, :first_name, :password, :password_confirmation, :street_address]
      params.require(resource_name).permit(allow)
  end
end