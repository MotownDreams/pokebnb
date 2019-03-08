class Flat < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :bookings

  validates :location, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch
    pg_search_scope :global_search,
      against: [ :name, :description, :location ],
      using: {
        tsearch: { prefix: true }
    }

end

