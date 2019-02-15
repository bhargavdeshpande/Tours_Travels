class Login < ApplicationRecord
  has_many :reviews
  has_many :itinenaries
  has_many :tours
  has_many :bookmarks
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :role, :presence => true
end
