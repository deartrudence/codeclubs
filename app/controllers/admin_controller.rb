class AdminController < ApplicationController

  before_filter :authorize_admin

  def panel
    @users = User.all.includes(:profile)
    @lessons = Lesson.all.includes(:profile).where(submitted: true)
    @workshops = Workshop.all
    @workshop = Workshop.new
    @email = MailingList.all
    @profile_email = Profile.on_mailing_list
    @download_list = DownloadList.all
    @glossaries = Glossary.all
    @glossary = Glossary.new


    if params[:lesson_filters].present?
      if params[:status].present?
        @lessons = params[:status]['Status'].present? && params[:status]['Status'] == '1' ? @lessons.order('approved desc') : @lessons.order('approved asc')
      end

      if params[:lesson_title].present?
        @lessons = params[:lesson_title]['Lesson Title'].present? && params[:lesson_title]['Lesson Title'] == '1' ? @lessons.order('LOWER(title) desc') : @lessons.order('LOWER(title) asc')
      end

      if params[:created].present?
        @lessons = params[:created]['Created'].present? && params[:created]['Created'] == '1' ? @lessons.order('created_at desc') : @lessons.order('created_at asc')  
      end
      respond_to do |format|
        format.js { render :partial => "lessons_admin_js" }
      end
    end

    if params[:user_filters].present?
      if params[:first_name].present?
        @users = params[:first_name]['First Name'].present? && params[:first_name]['First Name'] == '1' ? @users.order('profiles.first_name desc') : @users.order('profiles.first_name asc')
      end
      if params[:last_name].present?
        @users = params[:last_name]['Last Name'].present? && params[:last_name]['Last Name'] == '1' ? @users.order('profiles.last_name desc') : @users.order('profiles.last_name asc')
      end
      if params[:user_email].present?
        @users = params[:user_email]['email'].present? && params[:user_email]['email'] == '1' ? @users.order('email desc') : @users.order('email asc')
      end
      if params[:opt_in].present?
        @users = params[:opt_in]['Opt In?'].present? && params[:opt_in]['Opt In?'] == '1' ? @users.order('profiles.mailing_list desc') : @users.order('profiles.mailing_list asc')
      end
      respond_to do |format|
        format.js { render :partial => "users_admin_js" }
      end
    end
    
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

  def download_user_list
    @profiles = Profile.all
    respond_to do |format|
      format.html
      format.csv { 
        send_data Profile.to_csv(@profiles, params[:csv_options]), type: 'text/csv; charset=utf-8;header=present', disposition: 'attachement; filename=MailingList.csv'
      }
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
