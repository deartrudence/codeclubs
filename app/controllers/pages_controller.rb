class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:about]	
  def about
    @workshops = Workshop.all
    @download_list = DownloadList.new
    if params[:first_name]
    	@download_list.update(params)
    end	
  end
end
