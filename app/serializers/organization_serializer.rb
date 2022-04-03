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
class OrganizationSerializer
  include JSONAPI::Serializer
  attributes :name, :image, :phone, :address
end
