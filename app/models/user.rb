class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true
  validates :primaryPhone, presence: true

  belongs_to :person_type
  
  has_one :person_identifier

  accepts_nested_attributes_for :person_identifier

  def with_person_identifier
    build_person_identifier if person_identifier.nil?
    self
  end
end
