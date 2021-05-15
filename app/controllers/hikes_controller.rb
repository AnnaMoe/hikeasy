class HikesController < ApplicationController

  before_action :set_hike, only: [:show]


   def index
    @hikes = policy_scope(Hike).order(created_at: :desc)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @hikes.geocoded.map do |hike|
      {
        lat: hike.destination_latitude,
        lng: hike.destination_longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { hike: hike })
      }
    end
  end


  def show
    @booking = Booking.new
    authorize @hike
    authorize @booking
  end

 private
 def set_hike
    @hike = Hike.find(params[:id])
 end
end
