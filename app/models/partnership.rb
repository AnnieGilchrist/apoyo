class Partnership < ApplicationRecord
  validates :status, presence: true, allow_blank: false, inclusion: { in: ['pending', 'accepted', 'declined', 'completed'] }
  validates :details, presence: true, allow_blank: false
  belongs_to :mission
  belongs_to :business

  def color
    if self.status == 'pending'
      '#FFFFFF'
    elsif self.status == 'accepted'
      '#5B00FF'
    else
      '#C4C4C4'
    end
  end
end
