# == Schema Information
#
# Table name: rols
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :rol do
    name { "MyString" }
    description { "MyString" }
  end
end
