class Tour < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :itinenaries, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
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
      selected_locs = Tour.joins(:itinenaries)
      #"INNER JOIN itinenaries ON itinenaries.tour_id = tours.id").where('itinenaries.country' => search_country)#
      # .select('tours.*, itinenaries.country as country, itinenaries.state as state')
      #"INNER JOIN itinenaries ON itinenaries.tour_id = tours.id")
    else
      selected_locs = Tour.all
    end
    if search_state != ""
      selected_locs=selected_locs.where('itinenaries.state' => search_state)
    end
    if search_tourname != ""
      selected_locs=selected_locs.where(tourname: search_tourname)
    end

    if search_country != ""
      selected_locs=selected_locs.where('itinenaries.country' => search_country)
    end
    if search_price != ""
      selected_locs=selected_locs.where(price: search_price.to_i)
    end
     return selected_locs
  end

end
