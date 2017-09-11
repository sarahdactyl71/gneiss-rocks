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
      # encoded_image = Base64.encode64(@rock.image)
      # Rock.update(@rock.id, image: encoded_image)
      flash[:success] = "Rock has been successfully created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @rock = Rock.find(params[:id])
  end

  private

  def rock_params
    params.require(:rock).permit(:location_found, :description, :image, :image_file_name, :image_file_size, :image_content_type, :image_updated_at)
  end
end
