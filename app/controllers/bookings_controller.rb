class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :confirmation, :chatroom]

  def new
    @hike = Hike.find(params[:hike_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @hike = Hike.find(params[:hike_id])
    @group_hike = GroupHike.find(params[:booking][:group_hike])
    @booking = Booking.new(booking_params)
    @booking.hike = @hike
    @booking.group_hike = @group_hike
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
    
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
    @bookings = Booking.where(group_hike: @booking.group_hike)
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
    authorize @booking
    @chatroom = @booking.group_hike.chatroom
    @message = Message.new(chatroom: @chatroom)
  end

  private

  def set_booking
    @booking =Booking.find(params[:id] || params[:booking_id])
    authorize @booking
  end

  def booking_params
    params
      .require(:booking)
      .except(:group_hike)
      .permit(
        :first_name, :last_name, :phone_number, :credit_card, 
        :credit_card_expiration_month, :credit_card_expiration_year,
        :credit_card_cvc, :email
      )
      #:credit_card_expiration_month, :credit_card_expiration_year, :credit_card_cvc
  end
end
