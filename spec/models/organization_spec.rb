# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id            :bigint           not null, primary key
#  about_us_text :text
#  address       :string
#  discarded_at  :datetime
#  email         :string           not null
#  name          :string           not null
#  phone         :integer
#  welcome_text  :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  slide_id      :bigint
#
# Indexes
#
#  index_organizations_on_discarded_at  (discarded_at)
#  index_organizations_on_email         (email) UNIQUE
#  index_organizations_on_slide_id      (slide_id)
#
# Foreign Keys
#
#  fk_rails_...  (slide_id => slides.id)
#
require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject(:organization) { build(:organization) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:welcome_text) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:slides).dependent(:destroy) }
  end
end
