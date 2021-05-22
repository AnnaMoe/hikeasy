class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @hikes = policy_scope(Hike).order(created_at: :desc)
  end
end
