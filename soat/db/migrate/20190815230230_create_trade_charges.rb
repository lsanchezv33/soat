# frozen_string_literal: true

# Trade Charge Model
class CreateTradeCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_charges do |t|
      t.string :kind_class,     null: false
      t.string :subtype,  null: false
      t.float :premium,   null: false
      t.float :runt,      null: false, default: 1800.0
      t.float :revenue,   null: false

      t.timestamps
    end

    add_index :trade_charges, :kind_class, unique: false
  end
end
