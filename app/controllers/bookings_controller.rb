class BookingsController < ApplicationController

  def new
    @booking =Booking.new
  end

  def create
    @hike = Hike.find(params[:hike_id])
    @booking = Booking.new(booking_params)
    @booking.hike = @hike
    @booking.user = current_user
    @booking.save!
    redirect_to edit_hike_booking_path(@hike, @booking)
  end

  def edit
    @hike = Hike.find(params[:hike_id])
    @booking =Booking.find(params[:id])
  end

  # def update
  #   @booking =Booking.find(params[:id])
  #   @booking.update(booking_params)
  #   @booking.save
  #     redirect_to hike_booking_path(@booking.hike, @booking)
  # end

  def show
    @booking =Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(:date)
    end

end
