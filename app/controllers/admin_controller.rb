class AdminController < ApplicationController
  def panel
    @users = Profile.all
    @lessons = Lesson.all
    @email = MailingList.all
  end
end
