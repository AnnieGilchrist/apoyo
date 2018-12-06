class PartnershipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.organisation_type == 'Business'
        # scope.where("SELECT * FROM partnerships
        #               WHERE partnerships.business_id = #{user.business_id}")
        scope.where(business_id: user.organisation_id)
      elsif user.organisation_type == 'Charity'
        # scope.where("SELECT * FROM partnerships
        #               JOIN missions ON missions.id = partnerships.mission_id
        #               WHERE missions.charity_id = #{user.charity_id}")
        scope.joins("JOIN missions ON missions.id = partnerships.mission_id").where(missions: { charity_id: user.organisation_id })
        # Partnership.joins(mission).where
      end
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

  private

  def user_is_owner?
    user.organisation == record.mission.charity || user.organisation == record.business
  end
end
