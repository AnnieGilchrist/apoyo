class AddOrganisationTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :organisation, polymorphic: true, index: true
  end
end
