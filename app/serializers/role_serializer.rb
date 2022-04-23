# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class RoleSerializer
  include JSONAPI::Serializer

  attributes :name, :description
  has_many :user
end
