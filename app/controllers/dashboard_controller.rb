class DashboardController < ApplicationController
 
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @favourite_hikes =  @current_user.favorited_by_type('Hike')
  end
end
