class ChangeColumnNameInFollows < ActiveRecord::Migration[5.2]
  def change
    rename_column :follows, :charity_id, :followed_id
    rename_column :follows, :business_id, :follower_id

    add_column :follows, :followed_type, :string
    add_column :follows, :follower_type, :string

  end
end
