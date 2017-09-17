require "google/cloud/vision"
require 'googleauth'


# scopes =  ['https://www.googleapis.com/auth/cloud-platform',
#            'https://www.googleapis.com/auth/compute']
# authorization = Google::Auth.get_application_default(scopes)

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



  def upload_file(image_path, rock)
    project_id = "gneiss-rocks"
    bucket_name = "gneiss-rocks"
    local_file_path   = image_path
    storage_file_path = nil

    require "google/cloud/storage"

    storage = Google::Cloud::Storage.new project: project_id
    bucket  = storage.bucket bucket_name

    file = bucket.create_file local_file_path, storage_file_path

    file.acl.public!

    puts "#{file.name} is publicly accessible at #{file.public_url}"
    rock.update(public_url: file.public_url)
  end

  def detect_labels(image_path)
    project_id = "gneiss-rocks"

    vision = Google::Cloud::Vision.new project: project_id

    labels = vision.image(image_path).labels

    puts "Labels:"
      labels.each do |label|
      puts label.description
    end
  end

  def web_detection(image_path)
    project_id = "gneiss-rocks"

    vision = Google::Cloud::Vision.new project: project_id
    image  = vision.image image_path

    web = image.web

    web.entities.each do |entity|
      puts entity.description
    end
  end
end
