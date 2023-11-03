class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :computers
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # after_validation :print_geocoding_info

  # def print_geocoding_info
  #   puts "Geocoding Address: #{address}"
  #   puts "Geocoded Latitude: #{latitude}"
  #   puts "Geocoded Longitude: #{longitude}"
  # end
end
