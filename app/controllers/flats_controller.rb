class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query]
      @flats = Flat.where.not(latitude: nil, longitude: nil).global_search(params[:query])
    else
      @flats = Flat.all
    end

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end

  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(flat_params)
    # change this when we add sessions
    @flat.user = User.last
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :location, :price_per_night, :description)
  end
end
