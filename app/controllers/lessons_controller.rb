class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  skip_before_action :authenticate_user!, only: [:index]


  autocomplete :subject, :name, :class_name => 'ActsAsTaggableOn::Tag'
  autocomplete :code_concept, :name, :class_name => 'ActsAsTaggableOn::Tag'
  autocomplete :grade, :name, :class_name => 'ActsAsTaggableOn::Tag'

  def upvote
    @lesson.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { count: @lesson.get_upvotes.size } }
    end
  end

  def downvote
    @lesson.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { count: @lesson.get_upvotes.size } }
    end
  end

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.order(:cached_votes_up => :desc).first(6)
    if params[:search_complete]
      tags = []
      # make sure to not search against blank fields
      if params[:subject] != ''
        tags.push(params[:subject])
      end
      if params[:code_concept] != ''
        tags.push(params[:code_concept])
      end
      if params[:grade] != ''
        tags.push(params[:grade])
      end
      @tags = tags
      @lessons = Lesson.tagged_with(@tags).order(:cached_votes_up => :desc)

      respond_to do |format|
        format.js { render :partial => "lessons_js" }
      end

    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.profile = current_user.profile
    @lesson.subject_list.add(params[:subject_list], parse: true)
    @lesson.code_concept_list.add(params[:code_concept_list], parse: true)
    @lesson.grade_list.add(params[:grade_list], parse: true)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :duration_in_minutes, :level, :description, :curriculum_concepts, :prep, :programming_concepts, :content, :extensions, :answers, :video_link, :profile_id, :feature_image, :file_upload, :code_concept_list, :subject_list, :grade_list, :bootsy_image_gallery_id, :approved)
    end
end
