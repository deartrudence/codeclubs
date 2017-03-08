class LessonReferencesController < ApplicationController
  before_action :set_lesson_reference, only: [:show, :edit, :update, :destroy]

  # GET /lesson_references
  # GET /lesson_references.json
  def index
    @lesson_references = LessonReference.all
  end

  # GET /lesson_references/1
  # GET /lesson_references/1.json
  def show
  end

  # GET /lesson_references/new
  def new
    @lesson_reference = LessonReference.new
  end

  # GET /lesson_references/1/edit
  def edit
  end

  # POST /lesson_references
  # POST /lesson_references.json
  def create
    @lesson_reference = LessonReference.new(lesson_reference_params)

    respond_to do |format|
      if @lesson_reference.save
        format.html { redirect_to @lesson_reference, notice: 'Lesson reference was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_reference }
      else
        format.html { render :new }
        format.json { render json: @lesson_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_references/1
  # PATCH/PUT /lesson_references/1.json
  def update
    respond_to do |format|
      if @lesson_reference.update(lesson_reference_params)
        format.html { redirect_to @lesson_reference, notice: 'Lesson reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_reference }
      else
        format.html { render :edit }
        format.json { render json: @lesson_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_references/1
  # DELETE /lesson_references/1.json
  def destroy
    @lesson_reference.destroy
    respond_to do |format|
      format.html { redirect_to lesson_references_url, notice: 'Lesson reference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_reference
      @lesson_reference = LessonReference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_reference_params
      params.require(:lesson_reference).permit(:title, :url, :lesson_id)
    end
end
