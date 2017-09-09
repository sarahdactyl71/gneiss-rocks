class Rock < ApplicationRecord
  has_attached_file :image

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  def web_detection
    # Imports the Google Cloud client library
    require "google/cloud/vision"

    # Your Google Cloud Platform project ID
    project_id = "gneiss-rocks"

    # Instantiates a client
    vision = Google::Cloud::Vision.new project: project_id

    # The name of the image file to annotate
    file_name = "/system/rocks/images/000/000/001/original/other_rock.JPG?1504986718"

    # Performs label detection on the image file
    labels = vision.image(file_name).labels

    puts "Labels:"
    labels.each do |label|
     puts label.description
    end
  end
end
