class Review < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates :tourReview, :presence => true
end
