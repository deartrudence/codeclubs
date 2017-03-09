class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:about, :landing_page]	
  def about
    @workshops = Workshop.all
    @download_list = DownloadList.new
    #add to user profile pdf download count eahc time user downloads PDF
    if params[:current_user_id]
    	user_profile = User.find(params[:current_user_id]).profile
    	user_profile.pdf_download_count = user_profile.pdf_download_count + 1
    	user_profile.save
    end	
  end
end
