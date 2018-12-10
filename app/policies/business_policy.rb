class BusinessPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def follow?
    true
  end

  def unfollow?
    true
  end

  private

  def user_is_owner?
    user.organisation == record
  end
end
