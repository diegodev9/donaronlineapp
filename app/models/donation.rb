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
class Donation < ApplicationRecord
  belongs_to :company
  belongs_to :donor

  validates :amount, presence: true, numericality: true
  validates :payment_type, presence: true, 
                           inclusion: { in: ['credit card', 'credit_card', 'card'],
                                        message: "%{value} is not a valid payment type" }
end
