class ActsUser < ApplicationRecord
  belongs_to :user
  belongs_to :act

  validates :user, uniqueness: { scope: :act }
end
