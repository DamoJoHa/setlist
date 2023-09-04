class User < ApplicationRecord
  has_many :users_events
  has_many :events, through: :users_events
  has_and_belongs_to_many :acts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
