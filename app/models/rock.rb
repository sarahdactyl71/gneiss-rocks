class Rock < ApplicationRecord
  has_attached_file :image,
                    :styles => {
                    :thumb => "100x100#",
                    :small  => "150x150>",
                    :medium => "500x500" }

  validates_presence_of :location_found
  validates_presence_of :description

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def detect_labels(image_path)
    project_id = "gneiss-rocks"

    require "google/cloud/vision"

    vision = Google::Cloud::Vision.new project: project_id

    labels = vision.image(image_path).labels

    puts "Labels:"
      labels.each do |label|
      puts label.description
    end
  end

  def web_detection(image_path)
    project_id = "gneiss-rocks"

    require "google/cloud/vision"

    vision = Google::Cloud::Vision.new project: project_id
    image  = vision.image image_path

    web = image.web

    web.entities.each do |entity|
      puts entity.description
    end
  end
end
