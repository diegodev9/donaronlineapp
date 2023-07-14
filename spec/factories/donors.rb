# == Schema Information
#
# Table name: donors
#
#  id         :bigint           not null, primary key
#  browser    :json
#  email      :string
#  ip         :string
#  lastname   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :donor do
    email { Faker::Internet.email }
    lastname { Faker::Name.last_name }
    name { Faker::Name.first_name }
    ip { Faker::Internet.ip_v4_address }
    browser do
      {"browser": "Some User Agent", "platform": "Android Jelly Bean 4.2", "device": "Samsung"}
    end
  end
end
