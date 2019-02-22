class SearchbylocsController < ApplicationController
  before_action :set_searchbyloc, only: [:show, :edit, :update, :destroy]

  # GET /searchbylocs
  # GET /searchbylocs.json
  def index
    @searchbylocs = Searchbyloc.all
  end

  # GET /searchbylocs/1
  # GET /searchbylocs/1.json
  def show
  end

  # GET /searchbylocs/new
  def new
    @searchbyloc = Searchbyloc.new
  end

  # GET /searchbylocs/1/edit
  def edit
  end

  # POST /searchbylocs
  # POST /searchbylocs.json
  def create
    session[:search_tourname] = params[:tourname]
    session[:search_description] = params[:description]
    session[:search_flag] = "1"
    redirect_to tours_url, notice: 'Search was successfully created.'

  end

  # PATCH/PUT /searchbylocs/1
  # PATCH/PUT /searchbylocs/1.json
  def update
    respond_to do |format|
      if @searchbyloc.update(searchbyloc_params)
        format.html { redirect_to @searchbyloc, notice: 'Searchbyloc was successfully updated.' }
        format.json { render :show, status: :ok, location: @searchbyloc }
      else
        format.html { render :edit }
        format.json { render json: @searchbyloc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searchbylocs/1
  # DELETE /searchbylocs/1.json
  def destroy
    @searchbyloc.destroy
    respond_to do |format|
      format.html { redirect_to searchbylocs_url, notice: 'Searchbyloc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_searchbyloc
      @searchbyloc = Searchbyloc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def searchbyloc_params
      params.fetch(:searchbyloc, {})
    end
end
