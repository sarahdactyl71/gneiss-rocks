class Rock < ApplicationRecord
  has_attached_file :image,
                    styles: {
                    thumb: "100x100#",
                    small: "150x150>",
                    medium: "500x500" }

  validates_presence_of :location_found
  validates_presence_of :description
  validates_presence_of :image

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }



  def upload_file(image_path)

    # project_id:, bucket_name:, local_file_path:,
    #               storage_file_path: nil
    # [START upload_file]
    project_id = "gneiss-rocks"
    bucket_name = "gneiss-rocks"
    local_file_path   = image_path
    storage_file_path = nil

    require "google/cloud/storage"

    storage = Google::Cloud::Storage.new project: project_id
    bucket  = storage.bucket bucket_name

    file = bucket.create_file local_file_path, storage_file_path

    puts "Uploaded #{file.name}"
    # [END upload_file]
  end

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
