class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  def bookmytour (mode,new_session)
=begin
    if mode_of_booking ==1
      self.se
=end
    tour=Tour.find_by(tourname: new_session[:tourname])
    availableSeats=tour.availableSeats
    if availableSeats>=self.seatsToBook
      self.save
      tour.update_attribute(:availableSeats,availableSeats-seatsToBook)

    else
      if mode == 1
        #change seats to book to available seats
        self.save
        tour.update_attribute(:availableSeats,0)
      elsif mode == 2
      #book available seats with status booked, and remaining to waitlist. could be 2 entries in the database
      elsif mode ==3
       #add all to waitlist
      elsif mode == 4
        return false
      end
    end
  end
end

