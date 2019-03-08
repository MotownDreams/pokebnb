class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :state, presence: true
  validates :total_price, presence: true
  validate :end_after_start
  validates :start_date, :end_date, :presence => true
  validate :trip_before_today

  private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def trip_before_today
    return if end_date.blank? || start_date.blank?

    if Time.now >= end_date && start_date
      errors.add(:start_date, "must be at least today")
    end
  end
end
