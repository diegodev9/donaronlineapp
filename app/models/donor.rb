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

  validates :ip, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, 
                                              message: 'this email %<value>s is not valid' }
end
