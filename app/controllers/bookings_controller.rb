class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :confirmation]

  def new
    @booking =Booking.new
    authorize @booking
  end

  def create
    @hike = Hike.find(params[:hike_id])
    @booking = Booking.new(booking_params)
    @booking.hike = @hike
    @booking.user = current_user
    @booking.first_name = current_user.first_name
    @booking.last_name = current_user.last_name
    @booking.email = current_user.email
    authorize @booking
    @booking.save!
    redirect_to edit_hike_booking_path(@hike, @booking)
  end

  def edit
    @hike = Hike.find(params[:hike_id])
    @booking.save
  end

  def update
    @booking.update(booking_params)
    @booking.save
      redirect_to confirmation_hike_booking_path(@booking.hike, @booking)
  end

  def show
    @review = Review.new(booking: @booking)
    # redirect_to dashboard_index_path
    @hike = Hike.find(params[:hike_id])
     @markers =
      [{
        lat: @hike.start_address.latitude,
        lng: @hike.start_address.longitude,
      },
      {
        lat: @hike.end_address.latitude,
        lng: @hike.end_address.longitude,
      }
    ]
  end

  def confirmation
    
  end

  def chatroom
    @booking =Booking.find(params[:booking_id])
    authorize @booking
    @hike = Hike.find(params[:hike_id])
    @booking.hike = @hike
    @chatroom = @hike.chatroom
    @message = Message.new(chatroom: @chatroom)
    
  end

  private

    def set_booking
        @booking =Booking.find(params[:id])
      authorize @booking
    end

    def booking_params
      params.require(:booking).permit(:dates, :first_name, :last_name)
    end

end
