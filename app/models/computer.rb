class Computer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  geocoded_by :address
  # after_validation :geocode, if: :user_address_changed?
end
