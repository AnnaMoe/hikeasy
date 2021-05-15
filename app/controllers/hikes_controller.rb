class HikesController < ApplicationController

  before_action :set_hike, only: [:show]

 def index
  @hikes = policy_scope(Hike).order(created_at: :desc)
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
