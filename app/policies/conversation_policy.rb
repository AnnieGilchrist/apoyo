class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.organisation == record.participant_a || user.organisation == record.participant_b
  end

  def create?
    user.organisation == record.participant_a
  end
end
