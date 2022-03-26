# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  email        :string           not null
#  first_name   :string           not null
#  last_name    :string           not null
#  password     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_users_on_discarded_at  (discarded_at)
#  index_users_on_email         (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    firstName { 'MyString' }
    lastName { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
    photo { 'MyString' }
  end
end
