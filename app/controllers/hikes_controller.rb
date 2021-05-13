class HikesController < ApplicationController
  before_action :set_hike, only: [:show]

  def index
  end

  def show
    @booking = Booking.new
  end

  private
  def set_hike
    @hike = Hike.find(params[:id])
  end
end
