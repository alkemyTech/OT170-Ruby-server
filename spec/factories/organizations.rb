# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    imagen { nil }
    name { 'MyString' }
    address { 'MyString' }
    phone { 1 }
    email { 'MyString' }
    welcomeText { 'MyText' }
    aboutUsText { 'MyText' }
  end
end
