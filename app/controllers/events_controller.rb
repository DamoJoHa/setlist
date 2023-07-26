class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.all
    marked = @events.filter do |event|
      event.venue.geocoded?
    end
    @markers = marked.map{ |event|
      {
        lat: event.venue.latitude,
        lng: event.venue.longitude
      }
    }.uniq
  end
end
