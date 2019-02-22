class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    #@searches = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    #@search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    #@search = Search.new(search_params)
    #@search = Tour.filterOutResults(params)
    session[:search_tourname] = params[:tourname].to_s
    session[:search_price] = params[:price].to_s
    session[:search_country] = params[:country].to_s
    session[:search_state] = params[:state].to_s
    session[:search_flag] = "1"
    redirect_to tours_url, notice: 'Search was successfully created.'
    #format.html { redirect_to tours_url, notice: 'Search was successful.' }

  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.fetch(:search, {})
      #params.require(:tour).permit(:tourname, :description, :price, :deadline, :startDate, :endDate, :_
    end
end
