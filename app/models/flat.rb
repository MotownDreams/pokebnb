class Flat < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end

