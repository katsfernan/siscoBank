class PersonIdentifier < ApplicationRecord

    validates :identifierNumber, presence: true, length: { in: 6..20 }
    validates :emissionDate, presence: true
    validates :expirationDate, presence: true
    validate :expirationGreaterThanEmission

    belongs_to :identifier_type
    belongs_to :user

    def expirationGreaterThanEmission
        errors.add(:emissionDate, "must be less than expiration time") unless
        emissionDate < expirationDate
    end 
end
