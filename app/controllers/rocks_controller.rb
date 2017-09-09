require "base64"

class RocksController < ApplicationController

  def index
    @rocks = Rock.all
  end

  def new
    @rock = Rock.new
  end

  def create
    @rock = Rock.create!(rock_params)
    # @rock = Rock.create!(rock_params).encode_base_six_four(@rock.image)

    if @rock.save
      encoded_image = Base64,encode64(@rock.image)
      Rock.update(@rock.id, image: encoded_image)
      flash[:notice] = "Rock has been successfully created!"
      redirect_to root_path
    end
  end

  private

  def rock_params
    params.require(:rock).permit(:location_found, :description, :image)
  end
end
