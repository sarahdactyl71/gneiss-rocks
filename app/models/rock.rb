class Rock < ApplicationRecord
  has_attached_file :image

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

 # def detect_web project_id:, image_path:
 #   # [START vision_web_detection]
 #   # project_id = "gniess-rocks"
 #   # image_path = "Path to local image file, eg. './image.png'"
 #
 #   require "google/cloud/vision"
 #
 #   vision = Google::Cloud::Vision.new project: project_id
 #   image  = vision.image image_path
 #
 #   web = image.web
 #
 #   web.entities.each do |entity|
 #     puts entity.description
 #   end
 #
 #   web.full_matching_images.each do |image|
 #     puts image.url
 #   end
 #   # [END vision_web_detection]
 # end

end
