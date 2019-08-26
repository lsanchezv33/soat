# frozen_string_literal: true

# Trade Charge Model
class TradeCharge < ApplicationRecord
  # Includes -----------------------------------
  include PermissionsConcern

  # Relationships ------------------------------
  has_many :vehicles

  # Validations --------------------------------
  validates :kind_class,
            :subtype,
            :premium,
            :runt,
            :revenue,
            presence: { message: I18n.t('validations.unentered') }
end
