class HikesController < ApplicationController

  before_action :set_hike, only: [:show]


  def index
    if params[:beginner]
      @hikes = policy_scope(Hike).filter_by_difficulty("beginner")
    elsif params[:intermediate]
      @hikes = policy_scope(Hike).filter_by_difficulty("intermediate")
    elsif params[:expert]
      @hikes = policy_scope(Hike).filter_by_difficulty("expert")
    else
      @hikes = policy_scope(Hike).order(created_at: :desc)
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
