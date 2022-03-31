# frozen_string_literal: true

json.authorization do
  json.token @token
end
json.user do
  json.id @user.id
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.created_at @user.created_at
  json.updated_at @user.updated_at
end
