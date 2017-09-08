class RocksController < ApplicationController

  def index

  end

  private

  def rock_params
    params.require(:rock).permit(:location_found, :description, :image)
  end
end
