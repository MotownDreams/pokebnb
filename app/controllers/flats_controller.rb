class FlatsController < ApplicationController
  def index
    if params[:query]
      @flats = Flat.where("lower(location) LIKE ?", "%#{params[:query].downcase}%")
    else
      @flats = Flat.all
    end
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
