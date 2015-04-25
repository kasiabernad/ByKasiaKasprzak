class Admin::AdminController < ApplicationController
    before_action :authorize

    def authorize
      if !current_admin
        redirect_to new_admin_session_path
        return
      end
    end
end
