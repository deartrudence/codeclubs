class AdminController < ApplicationController
  def panel
    @users = Profile.all
    @lessons = Lesson.all.includes(:profile)
    @email = MailingList.all
    if params[:lesson].present?
      lesson = Lesson.find(params[:lesson])
      lesson.update(approved: params[:approved])
      lesson.save
    end
    if params[:filter].present?
      filter = params[:filter]
      if filter == 'approved'
        @lessons = Lesson.where(approved: true)
      elsif filter == 'unapproved'
        @lessons = Lesson.where(approved: false)
      else
        @lessons = Lesson.all.includes(:profile)
      end
      respond_to do |format|
        format.js { render :partial => "lessons_admin_js" }
      end
    end
  end
end
