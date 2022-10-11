class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include ActiveModel::Validations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
    message: :just_admit_letters_spaces }

  validates :email, uniqueness: true

  validates :primaryPhone, presence: true, length: { is: 11 }

  validate :validate_phone_number

  validate :validate_type_person_identifier_type

  belongs_to :person_type
  
  has_one :person_identifier, dependent: :destroy

  accepts_nested_attributes_for :person_identifier

  def with_person_identifier
    build_person_identifier if person_identifier.nil?
    self
  end

  private

  def validate_type_person_identifier_type
    person_type = PersonType.find(person_type_id)
    identifier_type = IdentifierType.find(
      person_identifier.identifier_type_id
    )
    
    if person_type.name === 'Natural' && ("RIF").include?(identifier_type.name)
        errors.add(:base, :natural_cant_contain_rif)

    elsif person_type.name === 'Jurídica' && (["Cédula", "Pasaporte"]).include?(identifier_type.name)
        errors.add(:base, :juridical_cant_contain_ci_or_pasport)
    end
  end

  def validate_phone_number
      unless primaryPhone.start_with? '0'
        errors.add :base, :primaryPhone_starts_with_zero
      end

      if !secondaryPhone.start_with?('0') && secondaryPhone.length > 0
          errors.add :secondaryPhone, "should starts with 0"
      end

      if secondaryPhone.length > 0 && secondaryPhone.length < 11
          errors.add :secondaryPhone, "length must be 11 characters"
      end
    end

end
