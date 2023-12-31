# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to have_many(:donations).dependent(:destroy) }
  it { is_expected.to have_many(:donors).through(:donations) }
  it { is_expected.to validate_presence_of(:name) }
end
