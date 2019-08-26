# frozen_string_literal: true

# Vehicles Model
class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :license_plate,      null: false
      t.integer :age,               null: false, default: 1
      t.integer :passenger_number,  null: false, default: 2, limit: 2
      t.integer :car_cylinder,      null: false
      t.string :tons,               null: false
      t.references :user, foreign_key: true
      t.references :trade_charge, foreign_key: true

      t.timestamps
    end

    add_index :vehicles, :license_plate, unique: false
  end
end
