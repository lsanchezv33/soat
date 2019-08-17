# frozen_string_literal: true

require 'rails_helper'
RSpec.describe PolicyPayment, type: :model do
  puts '## Policy Payment Model'
  unentered = I18n.t('validations.unentered')

  # Use to create policy_payment ------------------------------------
  before(:all) do
    @policy_payment = create(:policy_payment)
  end

  # Use to relationships ----------------------------------
  it 'has many vehicle payments' do
    policy_payment = described_class.reflect_on_association(:vehicle_payments)
    expect(policy_payment.macro).to eq :has_many
  end

  # use to validate record --------------------------------
  it 'is valid with this attributes' do
    expect(@policy_payment).to be_valid
  end

  # use to validate attributes ----------------------------
  it 'validate card number, cardholder and expiration_date presence' do
    is_expected.to validate_presence_of(:card_number)
      .with_message(unentered)

    is_expected.to validate_presence_of(:cardholder)
      .with_message(unentered)

    is_expected.to validate_presence_of(:expiration_date)
      .with_message(unentered)
  end

  it 'validate secure code and quotes presence' do
    is_expected.to validate_presence_of(:secure_code)
      .with_message(unentered)

    is_expected.to validate_presence_of(:quotes)
      .with_message(unentered)
  end

  # use to delete record ----------------------------------
  after(:all) do
    @policy_payment.destroy
  end
end
