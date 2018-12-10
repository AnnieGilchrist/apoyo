class AddLocationtoBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :location, :string
  end
end
