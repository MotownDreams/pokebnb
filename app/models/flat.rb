class Flat < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
end
