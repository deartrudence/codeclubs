class GlossariesController < ApplicationController
  before_action :set_glossary, only: [:show, :edit, :update, :destroy]

  # GET /glossaries
  # GET /glossaries.json
  def index
    lang = session[:locale]
    if params[:alphabetical]
      if params[:alphabetical][:terminology] == '1'
        @glossaries = Glossary.paginate(:page => params[:page], :per_page => 10).by_language(lang).order('LOWER(term) desc')
      elsif params[:alphabetical][:terminology] == '0'
        @glossaries = Glossary.paginate(:page => params[:page], :per_page => 10).by_language(lang).order('LOWER(term) asc')
      end
      respond_to do |format|
        format.js { render :partial => "glossary_list_js" }
      end
    else
       @glossaries = Glossary.paginate(:page => params[:page], :per_page => 10).by_language(lang).order('term asc')
    end

    if params[:single_letter]
      if params[:single_letter][:letter] == '#'
        # TODO fix this query (using regex)
        @glossaries = Glossary.where("term like ? OR term like ? OR term like ? OR term like ? OR term like ? OR term like ? OR term like ? OR term like ? OR term like ? OR term like ?", "0%", "1%", "2%", "3%", "4%", "5%", "6%", "7%", "8%", "9%").by_language(lang)
      else
        @glossaries = Glossary.where("term like ?", "#{params[:single_letter][:letter]}%").paginate(:page => params[:page], :per_page => 10).by_language(lang).order('term asc')
      end
      respond_to do |format|
        format.js { render :partial => "glossary_list_js" }
      end
    end  

  end

  # GET /glossaries/1
  # GET /glossaries/1.json
  def show
  end

  # GET /glossaries/new
  def new
    @glossary = Glossary.new
  end

  # GET /glossaries/1/edit
  def edit
  
  end

  # POST /glossaries
  # POST /glossaries.json
  def create
    @glossary = Glossary.new(glossary_params)
    @glossaries = Glossary.all
    respond_to do |format|
      if @glossary.save
        format.html { redirect_to @glossary, notice: 'Glossary was successfully created.' }
        format.json { render :show, status: :created, location: @glossary }
        format.js
      else
        format.html { render :new }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glossaries/1
  # PATCH/PUT /glossaries/1.json
  def update
    @glossaries = Glossary.all
    respond_to do |format|
      if @glossary.update(glossary_params)
        format.html { redirect_to @glossary, notice: 'Glossary was successfully updated.' }
        format.json { render :show, status: :ok, location: @glossary }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glossaries/1
  # DELETE /glossaries/1.json
  def destroy
    @glossaries = Glossary.all
    @glossary.destroy
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'Glossary was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glossary
      @glossary = Glossary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def glossary_params
      params.require(:glossary).permit(:term, :definition, :language)
    end
end
