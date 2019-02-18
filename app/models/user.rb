class User < ApplicationRecord
  has_secure_password
  has_many :tours, foreign_key: "username"
  has_many :reviews, foreign_key: "username"
  has_many :bookmarks, foreign_key: "username"
  has_many :itinenaries, foreign_key: "username"
  has_many :bookings, foreign_key: "username"
  validates :username, :presence => true, uniqueness: {case_sensitive: false}
  validates :email, :presence => true
  validates :role, :presence => true

end
