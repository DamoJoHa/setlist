class ActsController < ApplicationController
  def show
    @act = Act.find(params[:id])
  end
end
