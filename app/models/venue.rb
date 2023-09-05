class Venue < ApplicationRecord
  belongs_to :user
  has_many :events

  has_many :users_venues
  has_many :users, through: :users_venues

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
