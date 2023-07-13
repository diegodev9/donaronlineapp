# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  lastname               :string
#  level                  :integer
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:level) }

  describe 'create new user' do
    context 'when user level is "client"' do
      let(:new_user) { create(:user, level: 0) }

      it 'creates a client account' do
        expect(new_user.level).to eq('client')
      end
    end

    context 'when user level is "admin"' do
      let(:new_user) { create(:user, level: 1) }

      it 'creates an admin account"' do
        expect(new_user.level).to eq('admin')
      end
    end
  end
end
