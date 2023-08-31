class EventsController < ApplicationController
  skip_before_action :authenticate_user!, except: :toggle_attend

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

  def show
    @event = Event.find(params[:id])
  end

  def toggle_attend
    Event.find(params[:id]).users.push(current_user)
  end
end
