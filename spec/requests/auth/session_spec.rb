# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth::Sessions', type: :request do
  it "creates a Session" do
    user = create(:user)
    post "/auth/login", :params => { 
      :user => {
        :email => user.email,
        :password => user.password
      } 
    }

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON(response.body)['user']['id']).to eq(user.id)
    expect(JSON(response.body)['user']['first_name']).to eq(user.first_name)
    expect(JSON(response.body)['user']['last_name']).to eq(user.last_name)
    expect(JSON(response.body)['user']['email']).to eq(user.email)
    expect(response).to have_http_status(:created)
  end
end
