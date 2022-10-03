class PersonIdentifier < ApplicationRecord
    validates :identifierNumber, presence: true
    validates :emissionDate, presence: true
    validates :expirationDate, presence: true

    belongs_to :identifier_type
    belongs_to :user
end
