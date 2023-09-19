class Venue < ApplicationRecord
  belongs_to :user
  has_many :events

  has_many :users_venues
  has_many :users, through: :users_venues

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def google_address
    "https://www.google.com/maps/dir/?api=1&destination=" + latitude.to_s + "%2C+" + longitude.to_s
  end
end
