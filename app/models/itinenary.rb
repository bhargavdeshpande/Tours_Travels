class Itinenary < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates :state, :presence => true
  validates :country, :presence => true
end
