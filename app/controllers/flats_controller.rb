class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end
  
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end
end
