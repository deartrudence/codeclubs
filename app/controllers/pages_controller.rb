class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:about, :landing_page]	
  def about
    @workshops = Workshop.all
    @download_list = DownloadList.new
  end
end
