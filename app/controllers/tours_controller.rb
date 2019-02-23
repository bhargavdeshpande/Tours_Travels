class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  @@access = { 1 => { :new => false, :edit => false, :destroy => false},
               2 => {:new => true, :edit => true, :destroy => true},
               3 =>{:new => true, :edit => true, :destroy => true}}
  # GET /tours
  # GET /tours.json
  def index
    if session[:search_flag] == "1"

      @tours = Tour.filterOutResults(session[:search_tourname], session[:search_state], session[:search_price], session[:search_country], session[:search_sdate], session[:search_edate], session[:search_availableSeats])
      @tours.each do |tour|
        if tour.endDate < Date.today
          tour.tourStatus = "Completed"
          #tour.update_attributes(:tourstatus,  "Completed")
        elsif tour.startDate < Date.today
          tour.tourStatus = "In Progress"
          #tour.update_attributes(:tourstatus,  "In Progress")
        end
      end
      session[:search_flag] = "0"
    else
      @tours = Tour.all
      @tours.each do |tour|
        if tour.endDate < Date.today
          tour.tourStatus = "Completed"
          #tour.update_attributes(:tourstatus,  "Completed")
        elsif tour.startDate < Date.today
          tour.tourStatus = "In Progress"
          #tour.update_attributes(:tourstatus,  "In Progress")
        end
      end
    end

  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    session[:tour_id] = params[:id]
    session[:tourname] = @tour.tourname
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
      if session[:username] == tour_creator.username or session[:role]== 3
      else
        respond_to do |format|
          format.html { redirect_to tours_url, notice: 'Only the creator can edit their tours.' }
        end
      end
  end

  # POST /tours
  # POST /tours.json
  def create

    if tour_params[:endDate] < tour_params[:startDate]
      redirect_to new_tour_url, notice: 'Tour end date cannot be before start date.'
    elsif  tour_params[:startDate] < tour_params[:deadline]
      redirect_to new_tour_url, notice: 'Tour booking deadline has to be before start date.'
    elsif tour_params[:deadline] < Date.today.to_s
      redirect_to new_tour_url, notice: 'Tour booking deadline has to be in the future.'
    else

      avail_seats = tour_params[:totalSeats]

      @tour = Tour.new(tour_params.merge(:username => session[:username],:user_id => session[:user_id], :availableSeats => avail_seats, :waitlistedSeats => 0, :tourStatus => "In Future"))

      respond_to do |format|
        if @tour.save
          #@tour_temp = Tour.find(params[:id])
          session[:tourname]=@tour.tourname
          session[:tour_id]=@tour.id

          format.html { redirect_to new_itinenary_url, notice: 'Tour was successfully created.' }
          format.json { render :show, status: :created, location: @tour }
        else
          format.html { render :new }
          format.json { render json: @tour.errors, status: :unprocessable_entity }
        end
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
    if session[:role] == 3 or tour_creator.username == session[:username]
      @tour.destroy
      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Only the creator can delete their tour.' }
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
      params.require(:tour).permit(:tourname, :description, :price, :deadline, :startDate, :endDate, :totalSeats, :contactInfo, :username, :user_id)
    end
end
