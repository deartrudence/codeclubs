class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  before_action :require_permission, except: [:new, :create]

  # GET /profiles
  # GET /profiles.json
  def index
    if current_user.profile.is_admin?
      @profiles = Profile.all
    else
      redirect_to profile_path(current_user.profile)
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @lessons = @profile.lessons.includes(:profile)
    @favourites = current_user.find_up_voted_items
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    # if @profile.mailing_list == true
    #   MailingList.new(current_user)
    # end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.mailing_list == true
      MailingList.new(email: @profile.user.email).save
    end  

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update

    # raise 'hell'
    respond_to do |format|
      if @profile.update(profile_params)
        if @profile.mailing_list == false && MailingList.where(email: @profile.user.email).present?
          MailingList.where(email: @profile.user.email).destroy_all
        end
        if @profile.mailing_list == true && MailingList.where(email: @profile.user.email).blank?
          MailingList.new(email: @profile.user.email).save
        end 
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.friendly.find(params[:id])
    end

    def require_permission
      if current_user == Profile.friendly.find(params[:id]).user || current_user.admin?
      else
        redirect_to root_path
      end
      rescue ActiveRecord::RecordNotFound
          redirect_to(root_url, :notice => 'Record not found')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :school, :role, :grade, :mailing_list, :avatar, :number_of_students, :learner_age_range)
    end
end
