class HikesController < ApplicationController

  before_action :set_hike, only: [:show]


  def index
      @hikes = policy_scope(Hike).order(created_at: :desc)
      @hikes = @hikes.filter_by_difficulty(params[:difficulty]) if params[:difficulty]
      @hikes = @hikes.filter_by_accomodation(params[:accomodation]) if params[:accomodation]

      if params[:price]
        min = params[:price].first.empty? ? 400 : params[:price].first.to_i
        max = params[:price].last.empty? ? 800 : params[:price].last.to_i
        @hikes = @hikes.filter_by_price(min,max)
      end

    #@hikes = policy_scope(Hike).order(created_at: :desc)
    @markers = @hikes.map do |hike|
      {
        lat: hike.start_address.latitude,
        lng: hike.start_address.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { hike: hike })
      }
    end
  end


  def show
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


    @booking = Booking.new
    authorize @hike
    authorize @booking
  end

 private
 def set_hike
    @hike = Hike.find(params[:id])
 end
end
