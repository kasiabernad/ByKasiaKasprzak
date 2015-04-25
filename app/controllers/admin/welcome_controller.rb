class Admin::WelcomeController < Admin::AdminController
  skip_before_filter :authenticate_user!
  skip_before_filter :authenticate_admin!
  def index
  end
end

