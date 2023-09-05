class Act < ApplicationRecord
  belongs_to :user
  has_many :events

  has_many :acts_users
  has_many :users, through: :acts_users

  def follower_count
    users.count
  end
end
