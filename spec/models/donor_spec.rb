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
require 'rails_helper'

RSpec.describe Donor, type: :model do
  it { is_expected.to have_many(:donations) }
end
