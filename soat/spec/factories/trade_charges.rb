# frozen_string_literal: true

# Trade Charges Factory
FactoryBot.define do
  factory :trade_charge do
    kind_class { Faker::Vehicle.car_type }
    subtype { Faker::Types.rb_string }
    premium { Faker::Number.numerify('#######.0') }
    runt { Faker::Number.numerify('#######.0') }
    revenue { Faker::Number.numerify('#######.0') }
  end
end
