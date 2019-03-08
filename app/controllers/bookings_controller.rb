class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      @flat = @booking.flat
      render "flats/show"
    end
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to listings_path
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:flat_id, :start_date, :end_date, :total_price, :state)
  end
end
