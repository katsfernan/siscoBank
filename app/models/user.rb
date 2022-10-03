class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include ActiveModel::Validations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "just admit letters" }

  validates :email, uniqueness: true

  validates :primaryPhone, presence: true, length: { is: 11 }

  validates_with UserValidator

  belongs_to :person_type
  
  has_one :person_identifier

  accepts_nested_attributes_for :person_identifier

  def with_person_identifier
    build_person_identifier if person_identifier.nil?
    self
  end
end
