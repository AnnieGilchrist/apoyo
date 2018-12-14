class Charity < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false, inclusion: { in: ['environment', 'healthcare', 'disaster relief', 'education', 'humanitarian', 'children'] }
  validates :description, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
  validates :logo, presence: true
  has_many :users, as: :organisation, dependent: :destroy

  has_many :conversations, as: :participant_a, dependent: :destroy
  has_many :conversations, as: :participant_b, dependent: :destroy

  has_many :follows, as: :followed, dependent: :destroy
  has_many :follows, as: :follower, dependent: :destroy

  has_many :missions, dependent: :destroy

  mount_uploader :logo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  def followers
    Follow.where(followed_id: self.id, followed_type: "Charity")
  end

  def following
    Follow.where(follower_id: self.id, follower_type: "Charity")
  end

  def charity?
    self.class == Charity
  end

  def partners
    partners = []
    Partnership.all.each do |partnership|
      partners << partnership.business if partnership.mission.charity == self
    end
    partners.uniq
  end

end
