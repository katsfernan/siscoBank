class PersonIdentifier < ApplicationRecord

    validates :identifierNumber, presence: true, 
    format: { with: /\A\d+\z/, 
        message: :integer_only_no_signs }, 
    length: { in: 6..20 }, uniqueness: true
    validates :emissionDate, presence: true
    validates :expirationDate, presence: true
    validate :expirationGreaterThanEmission
    
    belongs_to :identifier_type
    belongs_to :user

    def expirationGreaterThanEmission
        if !emissionDate.blank? && !emissionDate.blank? 
            errors.add(:emissionDate, "must be less than expiration time") unless
            emissionDate < expirationDate
        end
    end
end
