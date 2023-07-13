# == Schema Information
#
# Table name: donations
#
#  id           :bigint           not null, primary key
#  amount       :float
#  payment_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null
#  donor_id     :bigint           not null
#
# Indexes
#
#  index_donations_on_company_id  (company_id)
#  index_donations_on_donor_id    (donor_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (donor_id => donors.id)
#
FactoryBot.define do
  factory :donation do
    payment_type { "MyString" }
    amount { 1.5 }
    company { nil }
    donor { nil }
  end
end