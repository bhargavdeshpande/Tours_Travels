class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  @@access = { 1 => { :new => false, :edit => false, :destroy => false},
               2 => {:new => true, :edit => true, :destroy => true},
               3 =>{:new => true, :edit => true, :destroy => true}}
  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    session[:tourname] = params[:tourname]
  end

  # GET /tours/new
  def new
    if @@access[session[:role]][:new]
      @tour = Tour.new
    else
      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Customers cannot create tours.' }
      end
    end

  end

  # GET /tours/1/edit
  def edit
      tour_creator = Tour.find_by(id: params[:id])
      if @@access[session[:role]][:edit]== false or session[:username] != tour_creator.username

        respond_to do |format|
          format.html { redirect_to tours_url, notice: 'Only the creator can edit their tours.' }
        end
      end
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params.merge(:username => session[:username]))
    respond_to do |format|
      if @tour.save
        format.html { redirect_to new_itinenary_url, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    tour_creator = Tour.find_by(id: params[:id])
    #tour_creator = Tour.find_by_sql(["SELECT * FROM tours WHERE id = ?", params[:id]])
    if @@access[session[:role]][:destroy]== false or tour_creator.username != session[:username]

      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Only the creator can delete their tour.' }
      end
    else
      @tour.destroy
      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:name, :description, :price, :deadline, :startDate, :endDate, :totalSeats, :availableSeats, :contactInfo, :username)
    end
end
