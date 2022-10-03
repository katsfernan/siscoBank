class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :primaryPhone, :integer
    add_column :users, :secondaryPhone, :integer
    add_reference :users, :person_type, null: false, foreign_key: true
  end
end
