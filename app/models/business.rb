class Business < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :website, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  has_many :users, as: :organisation, dependent: :destroy
  has_many :messages, as: :sender
  has_many :messages, as: :recipient
  has_many :follows, as: :followed, dependent: :destroy
  has_many :follows, as: :follower, dependent: :destroy
  has_many :partnerships, dependent: :destroy

  mount_uploader :logo, PhotoUploader

end
