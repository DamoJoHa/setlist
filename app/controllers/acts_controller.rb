class ActsController < ApplicationController
  def show
    @act = Act.find(params[:id])
  end

  def add_favorite
    Act.find(params[:id]).users.push(current_user)
    redirect_back_or_to root_path
  end

  def remove_favorite
    Act.find(params[:id]).users.delete(current_user)
    redirect_back_or_to root_path
  end
end
