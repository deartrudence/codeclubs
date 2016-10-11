class AdminController < ApplicationController

  before_filter :authorize_admin

  def panel
    @users = Profile.all
    @lessons = Lesson.all.includes(:profile)
    @workshops = Workshop.all
    @workshop = Workshop.new
    @email = MailingList.all
    @profile_email = Profile.on_mailing_list
    @download_list = DownloadList.all
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
      if params[:search].present?
        query = params[:search]
        @lessons = Lesson.search(query)
      end
      respond_to do |format|
        format.js { render :partial => "lessons_admin_js" }
      end
    end
    if params[:user_search]
      user_search = params[:user_search]
      @users = Profile.search(user_search)
      respond_to do |format|
        format.js { render :partial => "users_admin_js" }
      end
    end
    if params[:mailer_search]
      mailer_search = params[:mailer_search]
      @email = MailingList.search(mailer_search)
      respond_to do |format|
        format.js { render :partial => "mailers_admin_js" }
      end
    end

  end

  def download_mailing_list
    @email = MailingList.all
    respond_to do |format|
      format.html
      format.csv {
        send_data MailingList.export_csv(@email), type: 'text/csv; charset=utf-8;header=present', disposition: 'attachement; filename=MailingList.csv'
      }
    end
  end


end
