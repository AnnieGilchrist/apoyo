class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.belongs_to(user.organisation).joins(:messages).order("messages.created_at DESC").uniq + scope.belongs_to(user.organisation).includes(:messages).where(messages: { id: nil })
    end
  end

  def show?
    user.organisation == record.participant_a || user.organisation == record.participant_b
  end

  def create?
    user.organisation == record.participant_a
  end
end
