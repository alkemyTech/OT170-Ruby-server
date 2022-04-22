# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  email        :string
#  message      :text
#  name         :string
#  phone        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_contacts_on_discarded_at  (discarded_at)
#
FactoryBot.define do
  factory :contact do
    name { 'MyString' }
    phone { 1 }
    email { 'MyString' }
    message { 'MyText' }
  end
end
