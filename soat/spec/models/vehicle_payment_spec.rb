# frozen_string_literal: true

require 'rails_helper'
RSpec.describe VehiclePayment, type: :model do
  puts '## Vehicle Payment Model'
  # Use to create vehicle payment ------------------------------------
  before(:all) do
    @vehicle_payment = create(:vehicle_payment)
  end

  # Use to relationships ----------------------------------
  it 'belongs to vehicle payments' do
    vehicle_payment = described_class

    expect(vehicle_payment.reflect_on_association(:vehicle).macro)
      .to eq :belongs_to
    expect(vehicle_payment.reflect_on_association(:policy_payment).macro)
      .to eq :belongs_to
  end

  # use to delete record ----------------------------------
  after(:all) do
    @vehicle_payment.destroy
  end
end
