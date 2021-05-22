class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :confirmation, :chatroom]

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
  end

  def confirmation
    
  end

  def chatroom
    @hike = Hike.find(params[:hike_id])
    @booking.hike = @hike
    @chatroom = @hike.chatroom
    @message = Message.new(chatroom: @chatroom)
    
  end

  private

    def set_booking
      @booking =Booking.find(params[:id])
      #authorize @booking
    end

    def booking_params
      params.require(:booking).permit(:date, :first_name, :last_name)
    end

end
