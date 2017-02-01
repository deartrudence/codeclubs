class LessonDashboardsController < ApplicationController
 def home
   @lesson_bookmarked = current_user.find_up_voted_items
   @lesson_drafts = current_user.lessons.is_draft
   @lesson_submitted = current_user.lessons.is_submitted

   #create anonymous scope to start
   # @lessons = Lesson.where(nil)
   # @lessons = @lessons
   if params[:tab]
   	raise 'hell'
   end
   if params[:lesson_title]
     if params[:lesson_title][:title] == '1'
       @lesson_drafts = Lesson.is_draft.paginate(:page => params[:page], :per_page => 10).order('term desc')
     elsif params[:lesson_title][:title] == '0'
       @lesson_drafts = Lesson.is_draft.paginate(:page => params[:page], :per_page => 10).order('term asc')
     end
     respond_to do |format|
       format.js { render :partial => "lesson_list_js" }
     end
   else
      @lesson_drafts = current_user.lessons.is_draft.paginate(:page => params[:page], :per_page => 10).order('title asc')
   end
 end
end
