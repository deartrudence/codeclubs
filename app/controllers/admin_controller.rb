class AdminController < ApplicationController
  def panel
    @users = Profile.all
    @lessons = Lesson.all
  end
end
