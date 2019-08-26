# frozen_string_literal: true

require 'rails_helper'
RSpec.describe TradeCharge, type: :model do
  puts '## Trade Charge Model'

  unentered = I18n.t('validations.unentered')

  # Use to create trade_charge ------------------------------------
  before(:all) do
    @trade_charge = create(:trade_charge)
  end

  # Use to relationships ----------------------------------
  it 'belongs to trade charge' do
    trade_charge = described_class

    expect(trade_charge.reflect_on_association(:vehicles).macro)
      .to eq :has_many
  end

  # use to validate record --------------------------------
  it 'is valid with this attributes' do
    expect(@trade_charge).to be_valid
  end

  # use to validate attributes ----------------------------
  it 'validate kind_class and subtype presence' do
    is_expected.to validate_presence_of(:kind_class)
      .with_message(unentered)

    is_expected.to validate_presence_of(:subtype)
      .with_message(unentered)
  end

  it 'validate premium, runt and revenue presence' do
    is_expected.to validate_presence_of(:premium)
      .with_message(unentered)

    is_expected.to validate_presence_of(:runt)
      .with_message(unentered)

    is_expected.to validate_presence_of(:revenue)
      .with_message(unentered)
  end

  # use to delete record ----------------------------------
  after(:all) do
    @trade_charge.destroy
  end
end
