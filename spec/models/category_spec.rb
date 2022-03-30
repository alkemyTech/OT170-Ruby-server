# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id           :bigint           not null, primary key
#  description  :string           not null
#  discarded_at :datetime
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  news_id      :bigint
#
# Indexes
#
#  index_categories_on_discarded_at  (discarded_at)
#  index_categories_on_news_id       (news_id)
#
# Foreign Keys
#
#  fk_rails_...  (news_id => news.id)
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category) { build(:category) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:news).optional }
  end
end
