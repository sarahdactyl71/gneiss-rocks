class Api::V1::Rocks::LabelDetectionController < ApplicationController
  def show
    render json: Rock.find(params[:id]).label_detection(Rock.find(params[:id]).image.path)
  end
end
