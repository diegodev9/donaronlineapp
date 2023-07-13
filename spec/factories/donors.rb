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
    email { "MyString" }
    lastname { "MyString" }
    name { "MyString" }
    ip { "MyString" }
    browser { "" }
  end
end
