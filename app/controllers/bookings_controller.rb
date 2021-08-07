class BookingsController < ApplicationController
  include CloudinaryHelper

  before_action :set_booking, only: [:show, :edit, :update, :confirmation, :chatroom]

  def new
    @hike = Hike.find(params[:hike_id])
    @booking = Booking.new
    set_years_and_months
    authorize @booking
  end

  def create
    @group_hike = GroupHike.find(params[:booking][:group_hike])
    @hike = @group_hike.hike
    @booking = Booking.create!(
      hike: @hike, 
      group_hike: @group_hike, 
      user: current_user, 
      hike_sku: @hike.sku, 
      amount: @hike.price, 
      state: 'pending'
    )

    authorize @booking

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: @hike.name,
            images: [cl_image_path(@hike.photos.first.key)],
          },
          unit_amount: @hike.price_cents,
        },
        quantity: 1,
      }],            
      mode: 'payment',
      success_url: dashboard_url,
      cancel_url: dashboard_url
    })

    redirect_to session.url, status: 303
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

  def set_years_and_months
    @months = [ 
      ["January", "1"],
      ["February", "2"],
      ["March", "3"],
      ["April", "4"],
      ["May", "5"],
      ["June", "6"],
      ["July", "7"],
      ["August", "8"],
      ["September", "9"],
      ["October", "10"],
      ["November", "11"],
      ["December", "12"],
    ]
  end

  def booking_params
    params
      .require(:booking)
      .except(:group_hike)
      .permit(
        :first_name, :last_name, :phone_number, :credit_card, 
        :credit_card_expiration_month, :credit_card_expiration_year,
        :credit_card_cvc, :email, hike_sku: @hike.sku, amount: @hike.price, state: 'pending'
      )
      #:credit_card_expiration_month, :credit_card_expiration_year, :credit_card_cvc
  end
end
