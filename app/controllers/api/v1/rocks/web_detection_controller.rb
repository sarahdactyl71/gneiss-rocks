class Api::V1::Rocks::WebDetectionController < ApplicationController

  def show
    render json: Rock.find(params[:id]).web_detection(Rock.find(params[:id]).image.path)
  end
end
