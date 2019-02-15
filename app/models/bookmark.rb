class Bookmark < ApplicationRecord
  belongs_to :tour
  belongs_to :login
end
