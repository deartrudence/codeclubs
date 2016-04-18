class AdminController < ApplicationController
  def panel
    @users = Profile.all
    @lessons = Lesson.all
    @email = MailingList.all
    if params[:lesson].present?
      lesson = Lesson.find(params[:lesson])
      lesson.update(approved: params[:approved])
      lesson.save
    end
  end
end
