# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id            :bigint           not null, primary key
#  description   :string
#  discarded_at  :datetime
#  facebook_url  :string
#  instagram_url :string
#  linkedin_url  :string
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_members_on_discarded_at  (discarded_at)
#
require 'rails_helper'

RSpec.describe Member, type: :model do
  subject(:member) { build(:member) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_attached_of(:image) }
  end
end
