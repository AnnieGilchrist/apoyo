class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :duration
      t.references :charity, foreign_key: true

      t.timestamps
    end
  end
end
