class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      @flat = @booking.flat
      render "flats/show"
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:flat_id, :start_date, :end_date, :total_price)
  end
end
