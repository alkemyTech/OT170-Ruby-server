# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  email        :string
#  message      :text
#  name         :string
#  phone        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_contacts_on_discarded_at  (discarded_at)
#
require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { build(:contact) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
