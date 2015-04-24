class Admin::AdminController < ApplicationController
    before_action :authorize

    def authorize
      # binding.pry 

      if !current_admin
        redirect_to admin_root_path
        return
      end
    end
end
