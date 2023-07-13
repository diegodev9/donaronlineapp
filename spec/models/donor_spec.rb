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
  pending "add some examples to (or delete) #{__FILE__}"
end
