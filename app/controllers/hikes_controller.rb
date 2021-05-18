class HikesController < ApplicationController

  before_action :set_hike, only: [:show]


   def index
    @hikes = policy_scope(Hike).order(created_at: :desc)
  end


  def show
    @markers = 
      [{
        lat: @hike.start_address.latitude,
        lng: @hike.start_address.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { hike: @hike })
      },
      {
        lat: @hike.end_address.latitude,
        lng: @hike.end_address.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { hike: @hike })
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
