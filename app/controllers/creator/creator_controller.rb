class Creator::CreatorController < ApplicationController
    before_action :authorize

    def authorize
      if !current_user
        redirect_to new_user_session_path
        return
      end
    end
end
