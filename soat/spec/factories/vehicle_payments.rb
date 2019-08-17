# frozen_string_literal: true

# Vehicle Payments Factory
FactoryBot.define do
  factory :vehicle_payment do
    association :vehicle, factory: :vehicle
    association :policy_payment, factory: :policy_payment
  end
end
