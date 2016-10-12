class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  process resize_to_limit: [75, 75]
end
