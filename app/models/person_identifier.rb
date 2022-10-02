class PersonIdentifier < ApplicationRecord
    validates :identifierNumber, presence: true
    validates :emisisonDate, presence: true
    validates :expirationDate, presence: true

    belongs_to :user
    belongs_to :identifier_type
end
