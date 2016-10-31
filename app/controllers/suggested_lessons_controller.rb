class SuggestedLessonsController < ApplicationController
  before_action :set_suggested_lesson, only: [:show, :edit, :update, :destroy]

  # GET /suggested_lessons
  # GET /suggested_lessons.json
  def index
    @suggested_lessons = SuggestedLesson.all
  end

  # GET /suggested_lessons/1
  # GET /suggested_lessons/1.json
  def show
  end

  # GET /suggested_lessons/new
  def new
    @suggested_lesson = SuggestedLesson.new
  end

  # GET /suggested_lessons/1/edit
  def edit
  end

  # POST /suggested_lessons
  # POST /suggested_lessons.json
  def create
    @suggested_lesson = SuggestedLesson.new(suggested_lesson_params)

    respond_to do |format|
      if @suggested_lesson.save
        format.html { redirect_to @suggested_lesson, notice: 'Suggested lesson was successfully created.' }
        format.json { render :show, status: :created, location: @suggested_lesson }
      else
        format.html { render :new }
        format.json { render json: @suggested_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggested_lessons/1
  # PATCH/PUT /suggested_lessons/1.json
  def update
    respond_to do |format|
      if @suggested_lesson.update(suggested_lesson_params)
        format.html { redirect_to @suggested_lesson, notice: 'Suggested lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggested_lesson }
      else
        format.html { render :edit }
        format.json { render json: @suggested_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggested_lessons/1
  # DELETE /suggested_lessons/1.json
  def destroy
    @suggested_lesson.destroy
    respond_to do |format|
      format.html { redirect_to suggested_lessons_url, notice: 'Suggested lesson was successfully destroyed.' }
      format.js{}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggested_lesson
      @suggested_lesson = SuggestedLesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggested_lesson_params
      params.require(:suggested_lesson).permit(:lesson_id, :suggested_lesson_id)
    end
end
