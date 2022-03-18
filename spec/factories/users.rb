# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    firstName { "MyString" }
    lastName { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    photo { "MyString" }
  end
end
