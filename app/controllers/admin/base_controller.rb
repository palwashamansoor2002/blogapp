module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    layout "admin" # optional separate layout

    private

    def require_admin
      unless current_user&.admin?
        flash[:alert] = "Access denied."
        redirect_to root_path
      end
    end
  end
end

