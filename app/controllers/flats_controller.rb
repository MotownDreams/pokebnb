class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_flat, only:  [:show, :edit, :update, :destroy]

  def index
    @flats = policy_scope(Flat).order(created_at: :desc)
    if params[:query] && params[:query] != ""
      @flats = @flats.global_search(params[:query]) # .where.not(latitude: nil, longitude: nil)
    end

    if params["min-capacity"] && params["min-capacity"] != ""
      @flats = @flats.where("capacity >= ?", params['min-capacity'])
    end

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { flat: flat })
      }
    end
  end

  def show
    @booking = Booking.new
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def edit
    authorize @flat
  end

  def update
    authorize @flat
    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit
    end
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    authorize @flat
    @flat.destroy
    redirect_to flats_path
  end

  def listings_index
    @flats = policy_scope(Flat).order(created_at: :desc).where(user: current_user)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :location, :price_per_night, :description)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
