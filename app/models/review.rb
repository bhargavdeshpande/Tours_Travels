class Review < ApplicationRecord
  belongs_to :tour
  validates :tourReview, :presence => true
end
