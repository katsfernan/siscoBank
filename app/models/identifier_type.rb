class IdentifierType < ApplicationRecord
    validates :name, presence: true
    
    has_many :person_identifiers
end
