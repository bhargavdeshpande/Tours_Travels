class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    option=booking_params[:mode_of_booking].to_i
    @booking = Booking.new(booking_params.except(:mode_of_booking).merge(:username => session[:username], :tourname => session[:tourname], :user_id => session[:user_id], :tour_id => session[:tour_id]))
    if session[:role]==1
    respond_to do |format|
      mode,booked,waitlisted = @booking.bookmytour(option,session)
      if mode == 0
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      elsif mode == 1
        format.html { redirect_to @booking, notice: "You have booked #{booked} seats" }
        format.json { render :show, status: :created, location: @booking }
      elsif mode == 2
        format.html { redirect_to @booking, notice: "You have booked #{booked} seats and are waitlisted for #{waitlisted} seats" }
        format.json { render :show, status: :created, location: @booking }
      elsif mode == 3
        format.html { redirect_to @booking, notice: "You have been waitlisted for #{waitlisted} seats" }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { redirect_to new_booking_url, notice: 'Required number of seats unavailable' }
        format.json { render :show, status: :created, location: @booking }
      end
    end
    else
      format.html { render :new, notice:"Only customer can book a tour" }
      format.json { render json: @booking.errors, status: :unprocessable_entity }
    end
    end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.cancelBooking(session)
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:status, :seatsToBook, :username, :tourname, :user_id, :tour_id, :mode_of_booking)
    end
end
