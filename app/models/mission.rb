class Mission < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true
  belongs_to :charity

  mount_uploader :image, PhotoUploader
end
