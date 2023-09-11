class Event < ApplicationRecord
  belongs_to :act
  belongs_to :venue
  has_many :users_events
  has_many :users, through: :users_events

  def local_start_date
    start_time.localtime.strftime('%a %d %B, %Y')
  end

  def start_date_time
    start_time.localtime.strftime('%d %b, %H:%M')

  end

  def local_start_time
    start_time.localtime.strftime('%H:%M')
  end

  def local_end_time
    end_time.localtime.strftime('%H:%M')
  end

  def user_count
    users.count
  end
end
