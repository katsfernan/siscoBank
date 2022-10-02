class AddNullFalseUserPersonTypePersonIdentifierFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :primaryPhone, false
    change_column_null :person_types, :name, false
    change_column_null :person_identifiers, :identifierNumber, false
    change_column_null :person_identifiers,:emissionDate, false
    change_column_null :person_identifiers,:expirationDate, false
    change_column_null :identifier_types, :name, false
  end
end
