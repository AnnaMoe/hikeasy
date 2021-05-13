class HikesController < ApplicationController

  before_action :set_hike, only: [:show]

 def index
    if params[:query].present?
      @hikes = Hike.search_by_title_and_description(params[:query])
    else
      @hikes = Hike.all
    end
 end

  def show
    @booking = Booking.new
  end

 private
 def set_hike
    @hike = Hike.find(params[:id])
 end
end
