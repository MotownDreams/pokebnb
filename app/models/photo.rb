class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :flat
end
