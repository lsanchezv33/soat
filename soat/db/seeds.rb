# frozen_string_literal: true

# This file should contain all the record creation needed
# to seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# for created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

# Create admin --------------------------------------
User.find_or_create_by(email: 'root@admin.com') do |u|
  u.name = 'root'
  u.surname = 'company'
  u.password = '987654321'
  u.phone = 3_300_434_876
  u.document_number = '90000001'
  u.document_type = :citizenship_card
  u.role = 'admin'
end

# Use to create trade charge -------------------------
TradeCharge.find_or_create_by(kind_class: 'motos') do |t|
  t.subtype = 'menos de 100 c.c.'
  t.premium = 203_100
  t.revenue = 101_550
  t.runt = 1_800
end

TradeCharge.find_or_create_by(kind_class: 'camperos y camionetas') do |t|
  t.subtype = 'menos de 1500 c.c.'
  t.premium = 326_800
  t.revenue = 163_400
  t.runt = 1_800
end

TradeCharge.find_or_create_by(kind_class: 'carga o mixto') do |t|
  t.subtype = 'menos de 5 toneladas'
  t.premium = 366_300
  t.revenue = 183_150
  t.runt = 1_800
end

TradeCharge.find_or_create_by(kind_class: 'oficiales especiales') do |t|
  t.subtype = 'menos de 1500 c.c.'
  t.premium = 412_300
  t.revenue = 206_150
  t.runt = 1_800
end

TradeCharge.find_or_create_by(kind_class: 'autos familiares') do |t|
  t.subtype = 'menos de 1500 c.c.'
  t.premium = 183_900
  t.revenue = 91_950
  t.runt = 1_800
end

TradeCharge.find_or_create_by(kind_class: 'vehículos para seis o más pasajeros') do |t|
  t.subtype = 'menos de 2500 c.c.'
  t.premium = 328_700
  t.revenue = 164_350
  t.runt = 1_800
end

TradeCharge.find_or_create_by(kind_class: 'autos de negocios y taxis') do |t|
  t.subtype = 'menos de 1500 c.c.'
  t.premium = 228_200 
  t.revenue = 114_100
  t.runt = 1_800
end
