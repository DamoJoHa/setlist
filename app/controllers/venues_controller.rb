class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

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

  def show
    @venue = Venue.find(params[:id])
  end

  def add_favorite
    Venue.find(params[:id]).users.push(current_user)
    redirect_back_or_to root_path
  end

  def remove_favorite
    Venue.find(params[:id]).users.delete(current_user)
    redirect_back_or_to root_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :category, :description)
  end
end
