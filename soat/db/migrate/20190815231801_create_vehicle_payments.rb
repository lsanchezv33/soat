# frozen_string_literal: true

# Vehicle Payments Model
class CreateVehiclePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_payments do |t|
      t.references :vehicle, foreign_key: true
      t.references :policy_payment, foreign_key: true

      t.timestamps
    end
  end
end
