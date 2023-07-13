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
class Donor < ApplicationRecord
  has_many :donations
end
