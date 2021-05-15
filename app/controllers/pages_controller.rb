class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @hikes = policy_scope(Hike).order(created_at: :desc)

    @markers = @hikes.geocoded.map do |hike|
      {
        lat: hike.destination_latitude,
        lng: hike.destination_longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { hike: hike })
      }
    end
  end

  
end
