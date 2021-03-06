class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :participant_a, polymorphic: true, index: true
      t.references :participant_b, polymorphic: true, index: true
      t.references :partnership, foreign_key: true

      t.timestamps
    end
  end
end
