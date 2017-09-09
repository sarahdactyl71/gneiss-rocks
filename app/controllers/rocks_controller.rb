require "base64"

class RocksController < ApplicationController

  def index
    @rocks = Rock.order('created_at')
  end

  def new
    @rock = Rock.new
  end

  def create
    @rock = Rock.create!(rock_params)

    if @rock.save
      encoded_image = Base64.encode64(@rock.image)
      Rock.update(@rock.id, image: encoded_image)
      flash[:success] = "Rock has been successfully created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def rock_params
    params.require(:rock).permit(:location_found, :description, :image, :image_file_name)
  end
end
