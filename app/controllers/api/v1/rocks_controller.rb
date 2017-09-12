class Api::V1::RocksController < ApplicationController

  def index
    render json: Rock.all
  end

  def show
    rock = Rock.find_by(id: params[:id])
    if rock
      render json: rock
    else
      render json: {"Error": "Item not found"}, status: 404
    end
  end

end
