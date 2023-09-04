class User < ApplicationRecord
  has_many :users_events
  has_many :events, through: :users_events

  has_many :acts_users
  has_many :acts, through: :acts_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
