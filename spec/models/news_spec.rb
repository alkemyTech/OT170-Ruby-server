# frozen_string_literal: true

# == Schema Information
#
# Table name: news
#
#  id           :bigint           not null, primary key
#  content      :string           not null
#  discarded_at :datetime
#  name         :string           not null
#  news_type    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint
#
# Indexes
#
#  index_news_on_category_id   (category_id)
#  index_news_on_discarded_at  (discarded_at)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'rails_helper'

RSpec.describe News, type: :model do
  subject(:news) { build(:news) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_attached_of(:image) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:category).dependent(:destroy) }
  end
end
