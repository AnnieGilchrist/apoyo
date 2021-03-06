class Follow < ApplicationRecord
  belongs_to :followed, polymorphic: true, optional: true
  belongs_to :follower, polymorphic: true, optional: true

  validate :cannot_follow_same_multiple_times, :cannot_follow_self

  def cannot_follow_same_multiple_times
    matching = Follow.where(followed_id: followed_id, followed_type: followed_type, follower_id: follower_id, follower_type: follower_type)

    errors.add(:base, "cannot follow the same organisation multiple times") if matching.exists?
  end

  def cannot_follow_self
    if followed_id == follower_id && followed_type == follower_type
      errors.add(:base, "cannot follow self")
    end
  end

  def self.following?(organisation1, organisation2)
    self.where(followed_id: organisation2.id, followed_type: "#{organisation2.class}", follower_id: organisation1.id, follower_type: "#{organisation1.class}").any?
  end
end
