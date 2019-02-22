class Tour < ApplicationRecord
  has_many :reviews
  has_many :itinenaries
  has_many :bookings
  belongs_to :user
  has_many :bookmarks
  validates :tourname, :presence => true, uniqueness: {case_sensitive: false}
  validates :description, :presence => true
  validates :price, :presence => true, numericality: true;
  validates :deadline, :presence => true
  validates :startDate, :presence => true
  validates :endDate, :presence => true
  validates :totalSeats, :presence => true, numericality: {only_integer: true}
  validates :availableSeats, :presence => true, numericality: {only_integer: true}
  validates :contactInfo, :presence => true

  def self.filterOutResults(search_tourname, search_state, search_price, search_country)
    #Tour.find_by(tourname: "Pune")
    if search_country != "" or search_state != ""
      selected_locs = Tour.joins("INNER JOIN itinenaries ON tours.id = itinenaries.tour_id")
    else
      selected_locs = Tour.all
    end
    if search_state != ""
      selected_locs=selected_locs.where(state: search_state)
    end
    if search_tourname != ""
      selected_locs=selected_locs.where(tourname: search_tourname)
    end
    if search_country != ""
      selected_locs=selected_locs.where(country: search_country)
    end
    if search_price != ""
      selected_locs=selected_locs.where(price: search_price.to_i)
    end
     return selected_locs
  end

end
