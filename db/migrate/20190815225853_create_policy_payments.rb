# frozen_string_literal: true

# Policy Payments Model
class CreatePolicyPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :policy_payments do |t|
      t.bigint :card_number,       null: false
      t.string :cardholder,        null: false
      t.datetime :expiration_date, null: false
      t.bigint :secure_code,       null: false
      t.integer :quotes,           null: false, default: 6, limit: 2

      t.timestamps
    end

    add_index :policy_payments, :card_number, unique: false
    add_index :policy_payments, :cardholder, unique: false
  end
end
