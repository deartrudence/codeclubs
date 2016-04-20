class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def authorize_admin
    if current_user.profile.present?
      unless current_user.profile.role == "admin"
      redirect_to root_path
      end
    end
  end
end
