class Follow < ApplicationRecord
  belongs_to :charity
  belongs_to :business
  validates :charity_id, uniqueness: { scope: :business_id }
end
