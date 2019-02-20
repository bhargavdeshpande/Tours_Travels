class ItinenariesController < ApplicationController
  before_action :set_itinenary, only: [:show, :edit, :update, :destroy]
  @@access = { 1 => { :new => false, :edit => false, :destroy => false},
               2 => {:new => true, :edit => true, :destroy => true},
               3 =>{:new => true, :edit => true, :destroy => true}}
  # GET /itinenaries
  # GET /itinenaries.json
  def index
    @itinenaries = Itinenary.all
  end

  # GET /itinenaries/1
  # GET /itinenaries/1.json
  def show
  end

  # GET /itinenaries/new
  def new
    tour_creator = Tour.find_by(tourname: session[:tourname])
    #tour_creator=Tour.find_by_tourname(session[:tourname])
    #tour_creator = Tour.find_by_sql(["SELECT user_id FROM tours WHERE tour_id = ?", params[:itinenary][:tour_id]])
    if @@access[session[:role]][:new] and tour_creator.username == session[:username]
      @itinenary = Itinenary.new
    else
      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Only the creator can add an itinenary to their tour.' }
      end
    end

  end

  # GET /itinenaries/1/edit
  def edit
    tour_creator = Tour.find_by(tourname: session[:tourname])
    #tour_creator = Tour.find_by_sql(["SELECT user_id FROM tour WHERE tour_id = ?", params[:itinenary][:user_id]])
    if @@access[session[:role]][:edit] == false and tour_creator.username != session[:username]


      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Only the creator can edit an itinenary to their tour.' }
      end
    end
  end

  # POST /itinenaries
  # POST /itinenaries.json
  def create
    @itinenary = Itinenary.new(itinenary_params.merge(:user_id => session[:user_id], :tourname => session[:tourname], :username => session[:username]))

    respond_to do |format|
      if @itinenary.save
        format.html { redirect_to @itinenary, notice: 'Itinenary was successfully created.' }
        format.json { render :show, status: :created, location: @itinenary }
      else
        format.html { render :new }
        format.json { render json: @itinenary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinenaries/1
  # PATCH/PUT /itinenaries/1.json
  def update
    respond_to do |format|
      if @itinenary.update(itinenary_params)
        format.html { redirect_to @itinenary, notice: 'Itinenary was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinenary }
      else
        format.html { render :edit }
        format.json { render json: @itinenary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinenaries/1
  # DELETE /itinenaries/1.json
  def destroy
    tour_creator = Tour.find_by(tourname: session[:tourname])
    if session[:username] == tour_creator.username or session[:role] == 1
      @itinenary.destroy
      respond_to do |format|
        format.html { redirect_to itinenaries_url, notice: 'Itinenary was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to itinenaries_url, notice: 'Not authorised to delete the itinenary.' }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinenary
      @itinenary = Itinenary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinenary_params
      params.require(:itinenary).permit(:state, :country, :tourname, :username, :user_id, :tour_id)

    end
end
