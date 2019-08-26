# frozen_string_literal: true

# Policy Payments Factory
FactoryBot.define do
  date = DateTime.now

  factory :policy_payment do
    card_number { Faker::Number.numerify('################') }
    cardholder { Faker::Name.unique.name }
    expiration_date {
      Faker::Time.between(from: date - 6.months, to: date + 6.months)
    }

    secure_code { Faker::Number.numerify('####') }
    quotes { Faker::Number.numerify('#') }
  end
end
