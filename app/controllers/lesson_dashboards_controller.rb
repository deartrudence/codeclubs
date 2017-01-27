class LessonDashboardsController < ApplicationController
 def home
    @profile = current_user.profile
   @lessons = @profile.lessons.includes(:profile)
   @favourites = current_user.find_up_voted_items
 end
end
