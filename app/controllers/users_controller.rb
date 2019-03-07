class UsersController < ApplicationController
  def show
    @flat = Flat.find(params[:id])
    redirect_to user_path
  end

  # def edit
  #   @flat = Flat.find(params[:id])
  # end
end
