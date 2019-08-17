# frozen_string_literal: true

FactoryBot.define do
  types = [:citizenship_card, :foreign_id_card, :passport]

  factory :user do
    name { Faker::Name.unique.first_name }
    surname { Faker::Name.unique.last_name }
    phone { Faker::PhoneNumber.numerify('320#######') }

    document_number { Faker::Number.number }
    role { 'customer' }
    email { Faker::Internet.safe_email }

    password { Faker::Number.number }
    document_type { types.sample }
  end
end
