class DownloadListsController < ApplicationController
  before_action :set_download_list, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  # GET /download_lists
  # GET /download_lists.json
  def index
    @download_lists = DownloadList.all
  end

  # GET /download_lists/1
  # GET /download_lists/1.json
  def show
  end

  # GET /download_lists/new
  def new
    @download_list = DownloadList.new
  end

  # GET /download_lists/1/edit
  def edit
  end

  # POST /download_lists
  # POST /download_lists.json
  def create
    @download_list = DownloadList.new(download_list_params)

    respond_to do |format|
      if @download_list.save
        send_file(Rails.root.join('public' , 'assets', 'TLC-gettingstartedguide.pdf'))
        format.html { redirect_to about_path, notice: 'Download list was successfully created.' }
        format.json { render :show, status: :created, location: @download_list }
      else
        format.html { render :new }
        format.json { render json: @download_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /download_lists/1
  # PATCH/PUT /download_lists/1.json
  def update
    respond_to do |format|
      if @download_list.update(download_list_params)
        format.html { redirect_to @download_list, notice: 'Download list was successfully updated.' }
        format.json { render :show, status: :ok, location: @download_list }
      else
        format.html { render :edit }
        format.json { render json: @download_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /download_lists/1
  # DELETE /download_lists/1.json
  def destroy
    @download_list.destroy
    respond_to do |format|
      format.html { redirect_to download_lists_url, notice: 'Download list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_download_list
      @download_list = DownloadList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def download_list_params
      params.require(:download_list).permit(:first_name, :last_name, :email)
    end
end
