class HikesController < ApplicationController

  def index
    if params[:query].present?
      @hikes = Hike.search_by_title_and_description(params[:query])
    else
      @hikes = Hike.all
    end
  end
end
