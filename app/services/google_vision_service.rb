class GoogleVisionService

  attr_reader: conn

  def initialize
    @conn = Faraday.new(url: "https://vision.googleapis.com/v1/images:annotate?key=#{ENV["vision_api_key"]}")
    @conn.post do |req|
      req.body = '{
                    "requests": [
                      {
                        "image": {
                          "content": "/9j/7QBEUGhvdG9zaG9...base64-encoded-image-content...fXNWzvDEeYxxxzj/Coa6Bax//Z"
                        },
                        "features": [
                          {
                            "type":"LABEL_DETECTION",
                            "maxResults":10
                          }
                        ]
                      }
                    ]
                  }'
      req.adapter  Faraday.default_adapter
  end

  # project_id = "Your Google Cloud project ID"
  # image_path = "Path to local image file, eg. './image.png'"

  # require "google/cloud/vision"
  #
  # vision = Google::Cloud::Vision.new project: project_id
  # image  = vision.image image_path
  #
  # web = image.web
  #
  # web.entities.each do |entity|
  #   puts entity.description
  # end
  #
  # web.full_matching_images.each do |image|
  #   puts image.url
  # end


end
