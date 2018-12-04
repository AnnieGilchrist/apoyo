class Business < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  has_many :users, as: :organisation, dependent: :destroy
  has_many :partnerships, dependent: :destroy
end
