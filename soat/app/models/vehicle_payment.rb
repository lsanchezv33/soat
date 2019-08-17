# frozen_string_literal: true

# Vehicle Payment Model
class VehiclePayment < ApplicationRecord
  # Includes -----------------------------------
  include PermissionsConcern

  # Relationships ------------------------------
  belongs_to :vehicle
  belongs_to :policy_payment
end
