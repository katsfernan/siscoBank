class CreatePersonIdentifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :person_identifiers do |t|
      t.string :identifierNumber
      t.datetime :emissionDate
      t.datetime :expirationDate

      t.timestamps
    end
  end
end
