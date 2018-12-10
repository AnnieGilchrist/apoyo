class RemoveForeignKeysFromFollows < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :follows, column: :follower_id
    remove_foreign_key :follows, column: :followed_id
  end
end
