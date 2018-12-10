class Message < ApplicationRecord
  validates :content, presence: true, allow_blank: false
  belongs_to :sender, polymorphic: true
  belongs_to :recipient, polymorphic: true
  belongs_to :partnership

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  def self.between(sender, recipient)
    Message.where(sender: sender, recipient: recipient).or(Message.where(sender: recipient, recipient: sender))
  end

  def self.conversation(organisation_one, organisation_two)
    Message.where(sender: organisation_one).or(Message.where(recipient: organisation_two)).group
  end
end

