class Api::V1::RocksController < ApplicationController

  def index
    render json: Rock.all
  end

  def show
    rock = Rock.find(params[:id])
    if rock
      render json: rock
    else
      render json: {"Error": "Item not found"}, status: 404
    end
  end

  def create
    rock = Rock.new(rock_params)

    if rock.save
      render json: rock
    else
      render json: rock.errors, status: 400
    end
  end

  def update
    rock = Rock.find(params[:id])

    if rock.update(rock_params)
      render json: rock
    else
      render json: rock.errors, status: 400
    end
  end

  private

  def rock_params
    params.require(:rock).permit(:location_found, :description, :image, :image_file_name, :image_file_size, :image_content_type, :image_updated_at)
  end

end
