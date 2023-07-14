# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def clear_db_and_files
  Company.destroy_all
  User.destroy_all
  Donor.destroy_all
  Donation.destroy_all
end

clear_db_and_files

User.create(email: 'admin@admin.com', password: 123456, level: 1)

5.times do |i|
  Company.create(name: "Company #{i}")
end

10.times do |i|
  donor = Donor.create(email: "donor#{i}@donor.com", name: Faker::Name.first_name, lastname: Faker::Name.last_name,
               ip: Faker::Internet.ip_v4_address, browser: { "browser": "Some User Agent",
                                                             "platform": "Android Jelly Bean 4.2",
                                                             "device": "Samsung"}
  )
  card_number_ = CreditCardValidations::Factory.random
  card_brand_ = CreditCardValidations::Detector.new(card_number_).brand
  Donation.create(payment_type: 'credit card', amount: Faker::Commerce.price, card_brand: card_brand_,
                  card_number: card_number_, company_id: Company.ids.sample, donor_id: donor.id )
end

