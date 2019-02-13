class Itinenary < ApplicationRecord
  belongs_to :tour
  validates :state, :presence => true
  validates :country, :presence => true
end
