class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :charity, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
