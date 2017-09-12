class Api::V1::Rocks::LabelDetectionController < ApplicationController
  def show
    render json: Rock.find(params[:id]).detect_labels(Rock.find(params[:id]).image.path)
  end
end
