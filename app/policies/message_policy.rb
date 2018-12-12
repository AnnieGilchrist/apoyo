class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.organisation == record.conversation.participant_a || user.organisation == record.conversation.participant_b
  end
end
