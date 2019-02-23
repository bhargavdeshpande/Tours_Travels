class Itinenary < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates :state, :presence => true, format:{with: /\A[a-zA-Z]+\z/, message: "name should be Alphabetic only"}
  validates :country, :presence => true, format:{with: /\A[a-zA-Z]+\z/, message: "name should be Alphabetic only"}
end
