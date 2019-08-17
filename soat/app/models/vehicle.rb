# frozen_string_literal: true

# Vehicle Model
class Vehicle < ApplicationRecord
  # Includes -----------------------------------
  include PermissionsConcern

  # Relationships ------------------------------
  belongs_to :user
  belongs_to :trade_charge

  has_many :vehicle_payments
  has_many :policy_payments, through: :vehicle_payments

  # Validations --------------------------------
  validates :license_plate,
            :age,
            :passenger_number,
            :car_cylinder,
            :tons,
            :user_id,
            :trade_charge_id,
            presence: { message: I18n.t('validations.unentered') }

  validates :license_plate,
            uniqueness: { message: I18n.t('validations.already_exists') }

  before_validation :upcase_plate
end
