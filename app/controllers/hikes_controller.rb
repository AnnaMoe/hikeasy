class HikesController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite
  before_action :set_hike, only: [:show, :toggle_favorite]


  def index
    @hikes = policy_scope(Hike).order(created_at: :desc)
    @hikes = @hikes.filter_by_difficulty(params[:difficulty]) if params[:difficulty]
    @hikes = @hikes.filter_by_accomodation(params[:accomodation]) if params[:accomodation]
    @hikes = @hikes.filter_by_max_price(params[:max_price]) if params[:max_price]
    @hikes = @hikes.filter_by_max_duration(params[:max_duration]) if params[:max_duration]
    @hikes = @hikes.filter_by_max_distance(params[:max_distance]) if params[:max_distance]

    #@hikes = policy_scope(Hike).order(created_at: :desc)
    @markers = @hikes.map do |hike|
      {
        lat: hike.start_address.latitude,
        lng: hike.start_address.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { hike: hike }),
        image_url:
        helpers.asset_url('icon_trekking.png')
      }
    end
  end

  def show
    @markers =
      [{
        lat: @hike.start_address.latitude,
        lng: @hike.start_address.longitude,
        image_url:
        helpers.asset_url('icon_trekking.png')
      },
      {
        lat: @hike.end_address.latitude,
        lng: @hike.end_address.longitude,
        image_url:
        helpers.asset_url('icon_trekking.png')
      }
    ]
    @booking = Booking.new
    authorize @hike
    authorize @booking
    related_difficulty = @hike.difficulty
    related_region = @hike.region
    related_accomodation = @hike.accomodation_type

    @related_hikes = Hike.where(region: related_region)
                      .or(Hike.where(difficulty: related_difficulty))
                      .or(Hike.where(accomodation_type: related_accomodation))
                      &.where.not(id: @hike.id)
                      .sample(4)
  end

  def toggle_favorite
    authorize @hike
    current_user.favorited?(@hike) ?
    current_user.unfavorite(@hike) :
    current_user.favorite(@hike)
  end

 private
 def set_hike
    @hike = Hike.find(params[:id])
 end
end
