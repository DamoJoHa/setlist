class UsersVenue < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :user, uniqueness: { scope: :venue }
end
