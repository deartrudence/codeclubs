class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'csv'

  protect_from_forgery with: :exception

  before_filter :get_emails
  before_action :authenticate_user!

  after_filter :store_location

  #direct user to current location on sign in
  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end


  def get_emails
    @mailing_list = MailingList.new
  end
  def authorize_admin
    if current_user.profile.present?
      unless current_user.profile.role == "admin"
      redirect_to root_path
      end
    end
  end
end
