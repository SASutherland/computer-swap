class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :computer

  validate :start_date_must_be_valid
  validate :end_date_must_be_valid

  private

  def start_date_must_be_valid
    if start_date.present? && start_date.to_date != start_date
      errors.add(:start_date, "must be a valid date")
    end
  end

  def end_date_must_be_valid
    if end_date.present? && end_date.to_date != end_date
      errors.add(:end_date, "must be a valid date")
    end
  end

end
