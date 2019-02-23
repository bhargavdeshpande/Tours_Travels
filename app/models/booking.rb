class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates :seatsToBook, presence: true, numericality: true
  def bookmytour (mode,new_session)
    tour=Tour.find_by(tourname: new_session[:tourname])
    availableSeats=tour.availableSeats
    if availableSeats>=self.seatsToBook
      self.save
      self.update_attribute(:status, "confirmed")
      tour.update_attribute(:availableSeats,availableSeats-seatsToBook)
      return 0,self.seatsToBook,0
    else
      if availableSeats == 0 and mode == 1
        mode = 4
      end
      if mode == 1
        self.seatsToBook = availableSeats
        self.save
        tour.update_attribute(:availableSeats,0)
        self.update_attribute(:status, "confirmed")
        return 1,availableSeats,0
      elsif mode == 2
        waitlistedSeats = self.seatsToBook - availableSeats
        init_wait_seats = tour.waitlistedSeats
        tour.update_attribute(:waitlistedSeats, init_wait_seats + waitlistedSeats)
        if availableSeats != 0
          self.seatsToBook = availableSeats
          self.save
          self.update_attribute(:status, "confirmed")
        end
        tour.update_attribute(:availableSeats,0)
        ####for waitlist######
        waitlist = self.dup
        waitlist.save
        waitlist.update_attribute(:status, "waitlist")
        waitlist.update_attribute(:seatsToBook, waitlistedSeats)
        return 2,availableSeats,waitlistedSeats
      elsif mode ==3
        self.save
        self.update_attribute(:status, "waitlist")
        waitlistedSeats = self.seatsToBook
        init_wait_seats = tour.waitlistedSeats
        tour.update_attribute(:waitlistedSeats, init_wait_seats + waitlistedSeats)
        return 3,0,self.seatsToBook
      elsif mode == 4
        return 4,0,0
      end
    end
  end

  def cancelBooking(new_session)
    if self.status =='confirmed'
      tour=Tour.find_by(tourname: new_session[:tourname])
      tour.update_attribute(:availableSeats, self.seatsToBook + tour.availableSeats)
      loop do
        bookingToConfirm = Booking.where("status =='waitlist' AND seatsToBook <= ?", self.seatsToBook).first
        break if bookingToConfirm == nil
        bookingToConfirm.update_attribute(:status, "confirmed")
        tour.update_attribute(:availableSeats, tour.availableSeats - bookingToConfirm.seatsToBook)
        tour.update_attribute(:waitlistedSeats, tour.waitlistedSeats-bookingToConfirm.seatsToBook)
      end
    elsif self.status == 'waitlist'
      tour=Tour.find_by(tourname: new_session[:tourname])
      tour.update_attribute(:waitlistedSeats, tour.waitlistedSeats - self.seatsToBook)
    end
  end
end

