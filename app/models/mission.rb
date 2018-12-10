class Mission < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true
  belongs_to :charity

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :image, PhotoUploader
end
