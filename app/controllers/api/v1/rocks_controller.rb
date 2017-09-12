class Api::V1::RockController < ApplicationController

  def index
    render json: Rock.all
  end

  def show
    render json: Rock.find(params[:id])
  end
end
