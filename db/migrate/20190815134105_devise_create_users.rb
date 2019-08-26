# frozen_string_literal: true

# Devise migration to users
class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :name,               null: false
      t.string :surname,            null: false
      t.bigint :phone,              null: false
      t.string :document_type,      null: false, default: "citizenship card"
      t.bigint :document_number,    null: false
      t.string :role,               null: false, default: "customer"
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Timestamps
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
