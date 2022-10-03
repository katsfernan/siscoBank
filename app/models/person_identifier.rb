class PersonIdentifier < ApplicationRecord

    validates :identifierNumber, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }, length: { in: 6..20 }, uniqueness: true
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
