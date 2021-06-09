class HikesController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite
  before_action :set_hike, only: [:show, :toggle_favorite]


  def index
    @hikes = policy_scope(Hike).order(created_at: :desc)
    @hikes = @hikes.filter_by_difficulty(params[:difficulty]) if params[:difficulty]
    @hikes = @hikes.filter_by_accomodation(params[:accomodation]) if params[:accomodation]
    

    if params[:price]
      min = params[:price].first.empty? ? 400 : params[:price].first.to_i
      max = params[:price].last.empty? ? 800 : params[:price].last.to_i
      @hikes = @hikes.filter_by_price(min, max)
    end
    if params[:distance]
      min = params[:distance].first.empty? ? 24 : params[:distance].first.to_i
      max = params[:distance].last.empty? ? 60 : params[:distance].last.to_i
      @hikes = @hikes.where distance: min..max
    end
    if params[:length]
      min = params[:length].first.empty? ? 2 : params[:length].first.to_i
      max = params[:length].last.empty? ? 9 : params[:length].last.to_i
      @hikes = @hikes.filter_by_length(min, max)
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
