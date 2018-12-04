class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :website
      t.string :charity_preferences
      t.string :services_offered
      t.text :description
      t.string :logo

      t.timestamps
    end
  end
end
