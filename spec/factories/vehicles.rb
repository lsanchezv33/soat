# frozen_string_literal: true

# Vehicles Factory
FactoryBot.define do
  factory :vehicle do
    license_plate { Faker::Vehicle.vin[0..5] }
    age { Faker::Number.numerify('#') }
    passenger_number { Faker::Number.numerify('#') }

    car_cylinder { Faker::Number.numerify('#') }
    tons { "#{Faker::Number.numerify('#')} Tons" }

    association :user, factory: :user
    association :trade_charge, factory: :trade_charge
  end
end
