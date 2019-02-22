class User < ApplicationRecord
  has_secure_password
  has_many :tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :itinenaries, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :username, :presence => true, uniqueness: {case_sensitive: false}
  validates :email, :presence => true
  validates :role, :presence => true

end
