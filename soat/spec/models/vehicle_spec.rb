# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Vehicle, type: :model do
  puts '## Vehicle Model'

  unentered = I18n.t('validations.unentered')
  already_exists = I18n.t('validations.already_exists')

  # Use to create vehicle ------------------------------------
  before(:all) do
    @vehicle = create(:vehicle)
  end

  # Use to relationships ----------------------------------
  it 'belongs to vehicles' do
    vehicle = described_class

    expect(vehicle.reflect_on_association(:user).macro)
      .to eq :belongs_to
    expect(vehicle.reflect_on_association(:trade_charge).macro)
      .to eq :belongs_to
  end

  # use to validate record --------------------------------
  it 'is valid with this attributes' do
    expect(@vehicle).to be_valid
  end

  # use to validate attributes ----------------------------
  it 'validate age and passenger_number presence' do
    is_expected.to validate_presence_of(:age)
      .with_message(unentered)

    is_expected.to validate_presence_of(:passenger_number)
      .with_message(unentered)
  end

  it 'validate car cylinder and tons presence' do
    is_expected.to validate_presence_of(:car_cylinder)
      .with_message(unentered)

    is_expected.to validate_presence_of(:tons)
      .with_message(unentered)
  end

  it 'validate license plate presence and uniqueness' do
    is_expected.to validate_presence_of(:license_plate)
      .with_message(unentered)

    is_expected.to validate_uniqueness_of(:license_plate)
      .ignoring_case_sensitivity
      .with_message(already_exists)
  end

  # use to delete record ----------------------------------
  after(:all) do
    @vehicle.destroy
  end
end
