class Game < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :rents
  has_many_attached :photos
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
