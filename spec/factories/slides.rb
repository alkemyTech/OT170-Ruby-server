# frozen_string_literal: true

# == Schema Information
#
# Table name: slides
#
#  id              :bigint           not null, primary key
#  order           :integer          not null
#  text            :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_slides_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
FactoryBot.define do
  factory :slide do
    imageUrl { nil }
    text { 'MyText' }
    order { 1 }
  end
end
