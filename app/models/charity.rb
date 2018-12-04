class Charity < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false, inclusion: { in: ['Environment', 'Healthcare', 'Disaster Relief', 'Education', 'Humanitarian', 'Children'] }
  validates :description, presence: true, allow_blank: false
  has_many :users, as: :organisation, dependent: :destroy
  has_many :missions, dependent: :destroy
end
