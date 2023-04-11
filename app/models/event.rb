class Event < ApplicationRecord
  belongs_to :act
  belongs_to :venue
end
