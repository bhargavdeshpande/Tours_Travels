class User < ApplicationRecord
  has_secure_password
  has_many :tours
  has_many :reviews
  has_many :bookmarks
  has_many :itinenaries

end
