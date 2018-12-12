class AmendColumnsInMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :conversation, foreign_key: true
    remove_column :messages, :sender_type
    remove_column :messages, :recipient_type
    remove_column :messages, :sender_id
    remove_column :messages, :recipient_id
    remove_column :messages, :partnership_id
  end
end
