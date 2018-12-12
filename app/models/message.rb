class Message < ApplicationRecord
  validates :content, presence: true, allow_blank: false
  validates :direction, presence: true
  belongs_to :conversation

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  def sender?(current)
    @conversation = self.conversation
    if current == @conversation.participant_a
      self.direction == "a-to-b"
    else
      self.direction == "b-to-a"
    end
  end
end
