class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
    @markers = @events.map{ |event|
      {
        lat: event.venue.latitude,
        lng: event.venue.longitude
      }
    }.uniq
  end

  def show
    @event = Event.find(params[:id])
    @markers = [{ lat: @event.venue.latitude, lng: @event.venue.longitude }]
  end

  def add_attend
    Event.find(params[:id]).users.push(current_user)
    redirect_to event_path(params[:id])
  end

  def remove_attend
    Event.find(params[:id]).users.delete(current_user)
    redirect_to event_path(params[:id])
  end
end
