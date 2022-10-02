class CreatePersonIdentifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :person_identifiers do |t|
      t.integer :identifierNumber
      t.datetime :emissionDate
      t.datetime :expirationDate

      t.timestamps
    end
  end
end
