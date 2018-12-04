class CreatePartnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :partnerships do |t|
      t.text :details
      t.string :status, default: "pending"
      t.references :mission, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
