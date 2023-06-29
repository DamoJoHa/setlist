class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    venue = Venue.new(venue_params)
    venue.user = current_user

    if venue.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :category, :description)
  end
end
