class Partnership < ApplicationRecord
  validates :status, presence: true, allow_blank: false, inclusion: { in: ['pending', 'accepted', 'declined', 'completed'] }
  belongs_to :mission
  belongs_to :business
end
