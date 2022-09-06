class LocationsController < ApplicationController
  def index
    if params[:query].present?
      @locations = Location.where("category LIKE ?", "%#{params[:query]}%")
    else
      @locations = Location.all
    end

    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "info_window", locals: {location: location}),
        image_url: helpers.asset_url("https://res.cloudinary.com/dbgvo56a1/image/upload/v1662397564/Pin_hwnomy.svg")
      }
    end
  end

  def show
    @location = Location.find(params[:id])
  end
end
