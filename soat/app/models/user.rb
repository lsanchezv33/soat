# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # Includes -----------------------------------
  include PermissionsConcern

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Use to document type
  enum document_type: [:citizenship_card, :foreign_id_card, :passport]

  # Relationships ------------------------------
  has_many :vehicles

  # Validations --------------------------------
  validates :name,
            :surname,
            :email,
            :phone,
            :document_type,
            :document_number,
            presence: { message: I18n.t('validations.unentered') }

  validates :email,
            uniqueness: { message: I18n.t('validations.already_exists') }

  # Scopes -------------------------------------
  scope :include_vehicles, -> { includes :vehicles }
  scope :customers, -> { where role: 'customer' }
end
