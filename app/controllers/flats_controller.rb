class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_flat, only:  [:show, :edit, :update, :destroy]

  def index
    @flats = policy_scope(Flat).order(created_at: :desc)
    if params[:query]
      @flats = Flat.global_search(params[:query]) # .where.not(latitude: nil, longitude: nil)
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
    # change this when we add sessions
    @flat.user = User.last
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat.destroy
    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :location, :price_per_night, :description)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
