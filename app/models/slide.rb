# frozen_string_literal: true

# == Schema Information
#
# Table name: slides
#
#  id              :bigint           not null, primary key
#  discarded_at    :datetime
#  order           :integer          not null
#  text            :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_slides_on_discarded_at     (discarded_at)
#  index_slides_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Slide < ApplicationRecord
  belongs_to :organization

  include Discard::Model

  has_many_attached :images

  validates :text, presence: true
  validates :order, presence: true
end
