class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :navbar_image do
    cloudinary_transformation width: 45, height: 45, gravity: 'center', crop: 'pad'
  end

  version :profile_image do
    cloudinary_transformation width: 100, height: 100, gravity: 'auto', radius: 'max', crop: :thumb, f: 'png'
  end
end
