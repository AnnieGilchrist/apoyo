class Conversation < ApplicationRecord
  belongs_to :participant_a, polymorphic: true
  belongs_to :participant_b, polymorphic: true
  belongs_to :partnership, optional: true
  has_many :messages, dependent: :destroy

  validate :cannot_have_multiple_conversations_with_same

  def cannot_have_multiple_conversations_with_same
    matching = Conversation.between(self.participant_a, self.participant_b).where(partnership_id: partnership_id)

    errors.add(:base, "cannot have multiple conversations with the same organisation") if matching.exists?
  end

  def self.belongs_to(current)
    Conversation.where(participant_a_id: current.id, participant_a_type: "#{current.class}").or(Conversation.where(participant_b_id: current.id, participant_b_type: "#{current.class}"))
  end

  def self.between(first, second)
    Conversation.where(participant_a_id: first.id, participant_a_type: "#{first.class}", participant_b_id: second.id, participant_b_type: "#{second.class}").or(Conversation.where(participant_a_id: second.id, participant_a_type: "#{second.class}", participant_b_id: first.id, participant_b_type: "#{first.class}"))
  end

  def self.conversation_for_partnership(partnership)
    Conversation.find_by(partnership_id: partnership.id)
  end

  def chatting_with(current)
    self.participant_a == current ? self.participant_b : self.participant_a
  end

  def recipient?(current)
    @last_message = self.messages.order(created_at: :desc).first
    if current == self.participant_a
      @last_message.direction == "b-to-a"
    else
      @last_message.direction == "a-to-b"
    end
  end

  def most_recent_message
    self.messages.order(created_at: :desc).first
  end

  def any_message_unread?
    @unread_messages = self.messages.where(read: false)
    return @unread_messages.count > 0
  end

  def empty?
    self.messages.empty?
  end
end
