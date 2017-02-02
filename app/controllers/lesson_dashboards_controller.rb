class LessonDashboardsController < ApplicationController
	# respond_to :html, :js
	def index
		@lesson_bookmarked = current_user.find_up_voted_items
		@lesson_drafts = current_user.lessons.has_been_submitted?(false)
		# @lesson_submitted = current_user.lessons.is_submitted

		#create anonymous scope to start
		@lessons = current_user.lessons.includes(:profile)

		@lessons = @lessons.has_been_submitted?(params[:submitted] == 'true' ? true : false) if params[:submitted].present?

		# @lessons = @lessons.order('title asc') if !params[:lesson_title].present?

		# @lessons = @lessons.order('title desc') if params[:lesson_title].present?

		@lessons = @lessons.order('updated_at desc') if params[:updated].present?



		#TODO ordering with acts as taggable

		if params[:filter_options] || params[:submitted]
			respond_to do |format|
				format.js { render :partial => "lesson_drafts_js" }
			end
		end
 end
end
