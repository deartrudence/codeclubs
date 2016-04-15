class AdminController < ApplicationController
  def panel
    @users = Profile.all

  end
end
