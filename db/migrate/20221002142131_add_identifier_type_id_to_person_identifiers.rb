class AddIdentifierTypeIdToPersonIdentifiers < ActiveRecord::Migration[7.0]
  def change
    add_reference :person_identifiers, :identifier_type, null: false, foreign_key: true
  end
end
