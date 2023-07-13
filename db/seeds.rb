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
