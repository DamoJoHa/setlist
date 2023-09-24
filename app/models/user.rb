class User < ApplicationRecord
  has_one :act
  has_one :venue
  
  has_many :users_events
  has_many :events, through: :users_events

  has_many :acts_users
  has_many :acts, through: :acts_users

  has_many :users_venues
  has_many :venues, through: :users_venues
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
