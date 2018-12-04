class CreateCharities < ActiveRecord::Migration[5.2]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :address
      t.string :website
      t.string :category
      t.text :description
      t.string :logo

      t.timestamps
    end
  end
end
