class LessonDashboardsController < ApplicationController
	# respond_to :html, :js
	def index
		@lesson_bookmarked = current_user.find_up_voted_items

		@lesson_drafts = current_user.lessons.has_been_submitted?(false).includes(:taggings)
		@lesson_submitted = current_user.lessons.has_been_submitted?(true).includes(:taggings)

		lesson_title = params[:locale] == 'en' ? 'Lesson Title' : 'Titre de la leçon'
		updated = params[:locale] == 'en' ? 'Updated' : 'FR Updated'

		if params[:draft_filters]
			if params[:lesson_title]
				@lesson_drafts = params[:lesson_title][lesson_title].present? && params[:lesson_title][lesson_title] == '1' ? @lesson_drafts.order('LOWER(title) desc') : @lesson_drafts.order('LOWER(title) asc')
			end
			if params[:lesson_updated]
				@lesson_drafts = params[:lesson_updated][updated].present? && params[:lesson_updated][updated] == '1' ? @lesson_drafts.order('updated_at desc') : @lesson_drafts.order('updated_at asc')
			end
		end

		if params[:submitted_filters]
			if params[:submitted_lesson_title]
				@lesson_submitted = params[:submitted_lesson_title][lesson_title].present? && params[:submitted_lesson_title][lesson_title] == '1' ? @lesson_submitted.order('LOWER(title) desc') : @lesson_submitted.order('LOWER(title) asc')
			end
			if params[:submitted_lesson_updated]
				@lesson_submitted = params[:submitted_lesson_updated][updated].present? && params[:submitted_lesson_updated][updated] == '1' ? @lesson_submitted.order('updated_at desc') : @lesson_submitted.order('updated_at asc')
			end
		end


		#TODO ordering with acts as taggable

		if params[:draft_filters]
			respond_to do |format|
				format.js { render :partial => "lesson_drafts_js" }
			end
		end
		if params[:submitted_filters]
			respond_to do |format|
				format.js { render :partial => "lesson_submitted_js" }
			end
		end	
 end
end
