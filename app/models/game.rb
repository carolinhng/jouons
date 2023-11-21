class Game < ApplicationRecord
  belongs_to :user
  has_many :rents
  has_many_attached :photos
end
