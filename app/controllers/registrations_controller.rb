class RegistrationsController < Devise::RegistrationsController
  private
  
  def sign_up_params
    binding.pry
      allow = [:email, :first_name, :password, :password_confirmation]
      params.require(resource_name).permit(allow)
  end
end