class RocksController < ApplicationController

  def index
    @rocks = Rock.order('created_at')
  end

  def new
    @rock = Rock.new
  end

  def create
    @rock = Rock.new(rock_params)

    if @rock.save
      @rock.upload_file(@rock.image.path, @rock)
      flash[:success] = "Rock has been successfully created!"
      redirect_to root_path
    else
      flash[:error] = "Missing required fields"
      redirect_to new_rock_path
    end
  end

  def show
    @rock = Rock.find(params[:id])
    image_path = @rock.public_url
    @web_info = @rock.web_detection(image_path)
    @label_info = @rock.detect_labels(image_path)
  end

  def destroy
    @rock = Rock.find(params[:id])
    @rock.destroy
    flash[:notice] = "Rock was successfully destroyed."
    redirect_to root_path
  end

  private

  def rock_params
    params.require(:rock).permit(:location_found, :description, :image, :image_file_name, :image_file_size, :image_content_type, :image_updated_at, :public_url)
  end
end
