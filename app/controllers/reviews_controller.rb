class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @hike = @booking.hike
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to hike_path(@hike)
    else
      render 'bookings/show'
    end
  end

  def review_params
    params.require(:review).permit(:comment, :booking_id, :rating)
  end
end
