class GoogleVisionService

  project_id = "gneiss-rocks"
  image_path = #path to local or external image

  require "google/cloud/vision"

  vision = Google::Cloud::Vision.new project: project_id
  image  = vision.image image_path

  web = image.web

  web.entities.each do |entity|
    entity.description
  end

  web.full_matching_images.each do |image|
    puts image.url
  end

end
