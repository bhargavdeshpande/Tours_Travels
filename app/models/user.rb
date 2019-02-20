class User < ApplicationRecord
  has_secure_password
  has_many :tours
  has_many :reviews
  has_many :bookmarks
  has_many :itinenaries
  has_many :bookings
  validates :username, :presence => true, uniqueness: {case_sensitive: false}
  validates :email, :presence => true
  validates :role, :presence => true

end
