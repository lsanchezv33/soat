# frozen_string_literal: true

# Policy payment model
class PolicyPayment < ApplicationRecord
  # Includes -----------------------------------
  include PermissionsConcern

  # Relationships ------------------------------
  has_many :vehicle_payments
  has_many :vehicles, through: :vehicle_payments

  # Validations --------------------------------
  validates :card_number,
            :cardholder,
            :expiration_date,
            :secure_code,
            :quotes,
            presence: { message: I18n.t('validations.unentered') }
end
