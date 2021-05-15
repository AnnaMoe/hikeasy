class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def new
    @booking =Booking.new
    authorize @booking
  end

  def create
    @hike = Hike.find(params[:hike_id])
    @booking = Booking.new(booking_params)
    @booking.hike = @hike
    @booking.user = current_user
    authorize @booking
    @booking.save!
    redirect_to edit_hike_booking_path(@hike, @booking)
  end

  def edit
    @hike = Hike.find(params[:hike_id])
  end

  def update
    @booking.update(booking_params)
    @booking.save
      redirect_to hike_booking_path(@booking.hike, @booking)
  end

  def show
    
  end

  private

    def set_booking
      @booking =Booking.find(params[:id])
    authorize @booking
    end

    def booking_params
      params.require(:booking).permit(:date)
    end

end
