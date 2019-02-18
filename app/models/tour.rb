class Tour < ApplicationRecord
  has_many :reviews, foreign_key: "tourname"
  has_many :itinenaries, foreign_key: "tourname"
  has_many :bookings, foreign_key: "tourname"
  belongs_to :user
  has_many :bookmarks, foreign_key: "tourname"
  validates :tourname, :presence => true, uniqueness: {case_sensitive: false}
  validates :description, :presence => true
  validates :price, :presence => true, numericality: true;
  validates :deadline, :presence => true
  validates :startDate, :presence => true
  validates :endDate, :presence => true
  validates :totalSeats, :presence => true, numericality: {only_integer: true}
  validates :availableSeats, :presence => true, numericality: {only_integer: true}
  validates :contactInfo, :presence => true
end
