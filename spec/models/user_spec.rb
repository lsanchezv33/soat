# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  puts '## User Model'

  unentered = I18n.t('validations.unentered')
  already_exists = I18n.t('validations.already_exists')
  types = [:citizenship_card, :foreign_id_card, :passport]

  # Use to enums ----------------------------------
  it 'define enum' do
    should define_enum_for(:document_type)
      .with_values(types)
      .backed_by_column_of_type(:string)
  end

  # Use to create user ------------------------------------
  before(:all) do
    @user = create(:user)
    @user.document_type = types.sample
  end

  # Use to relationships ----------------------------------
  it 'has many vehicles' do
    user = described_class.reflect_on_association(:vehicles)
    expect(user.macro).to eq :has_many
  end

  # use to validate record --------------------------------
  it 'is valid with this attributes' do
    expect(@user).to be_valid
  end

  # use to validate attributes ----------------------------
  it 'validate name, surname and phone presence' do
    is_expected.to validate_presence_of(:name)
      .with_message(unentered)

    is_expected.to validate_presence_of(:surname)
      .with_message(unentered)

    is_expected.to validate_presence_of(:phone)
      .with_message(unentered)
  end

  it 'validate document type and number presence' do
    is_expected.to validate_presence_of(:document_type)
      .with_message(unentered)

    is_expected.to validate_presence_of(:document_number)
      .with_message(unentered)
  end

  it 'validate email presence and uniqueness' do
    is_expected.to validate_presence_of(:email)
      .with_message(unentered)

    is_expected.to validate_uniqueness_of(:email)
      .case_insensitive
      .with_message(already_exists)
  end

  # use to delete record ----------------------------------
  after(:all) do
    @user.destroy
  end
end
