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
require 'rails_helper'

RSpec.describe Donation, type: :model do
  it { is_expected.to belong_to(:donor) }
  it { is_expected.to belong_to(:company) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount) }
  it { is_expected.to validate_presence_of(:payment_type) }
end
