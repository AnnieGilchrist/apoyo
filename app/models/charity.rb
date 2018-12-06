class Charity < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false, inclusion: { in: ['environment', 'healthcare', 'disaster relief', 'education', 'humanitarian', 'children'] }
  validates :description, presence: true, allow_blank: false
  has_many :users, as: :organisation, dependent: :destroy
  has_many :missions, dependent: :destroy

  mount_uploader :logo, PhotoUploader

  def followers
    Follow.where(charity_id: self.id).length
  end
end
