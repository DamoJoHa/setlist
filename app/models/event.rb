class Event < ApplicationRecord
  belongs_to :act
  belongs_to :venue

  def local_start_time
    start_time.localtime.strftime('%H:%M')
  end

  def local_end_time
    end_time.localtime.strftime('%H:%M')
  end
end
