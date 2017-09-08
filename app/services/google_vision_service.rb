class GoogleVisionService

  attr_reader: conn

  def initialize
    @conn = Faraday.new(url: "https://vision.googleapis.com/v1/images:annotate?key=#{ENV["vision_api_key"]}") do |req|
      req.body = '{
                    "requests": [
                      {
                        "image": {
                          "content": "/9j/7QBEUGhvdG9zaG9...base64-encoded-image-content...fXNWzvDEeYxxxzj/Coa6Bax//Z"
                        },
                        "features": [
                          {
                            "type": "LABEL_DETECTION"
                          }
                        ]
                      }
                    ]
                  }'
      req.adapter  Faraday.default_adapter
  end



end
