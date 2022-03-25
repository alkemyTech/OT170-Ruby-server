# frozen_string_literal: true

require 'rails_helper'

RSpec.describe News, type: :model do
  let(:news) { build(:news) }

  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_attachment_presence(:image) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category).required }
  end
end
