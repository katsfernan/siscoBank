class AddUserIdToPersonIdentifiers < ActiveRecord::Migration[7.0]
  def change
    add_reference :person_identifiers, :user, null: false, foreign_key: true
  end
end
