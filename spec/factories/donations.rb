# == Schema Information
#
# Table name: donations
#
#  id           :bigint           not null, primary key
#  amount       :float
#  card_brand   :string
#  card_number  :string
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
    card_number_ = CreditCardValidations::Factory.random
    card_brand_ = CreditCardValidations::Detector.new(card_number_).brand

    payment_type { 'credit card' }
    amount { Faker::Commerce.price }
    company
    donor
    card_brand { card_brand_ }
    card_number { card_number_ }
  end
end
