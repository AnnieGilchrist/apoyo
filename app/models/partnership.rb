class Partnership < ApplicationRecord
  validates :status, presence: true, allow_blank: false, inclusion: { in: ['pending', 'accepted', 'declined', 'completed'] }
  validates :details, presence: true, allow_blank: false
  belongs_to :mission
  belongs_to :business
  validates :business_id, uniqueness: { scope: :mission_id }
  has_many :conversations, dependent: :destroy

  def color
    if self.status == 'pending'
      '#FFD300'
    elsif self.status == 'accepted'
      # '#5B00FF'
      '#24c98c'
    else
      '#C4C4C4'
      #e0415e
    end
  end
end
