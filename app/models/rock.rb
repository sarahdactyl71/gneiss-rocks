class Rock < ApplicationRecord
  mount_uploader :image, ImageUploader
end
