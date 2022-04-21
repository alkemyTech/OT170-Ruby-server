# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Auth::Sessions', type: :request do\
  context 'with valid parameters' do
    let(:user) { create(:user) }

    before do
      post '/api/v1/auth/login', params: {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:created)
    end

    it 'renders a JSON response with the logged user' do
      expect(JSON(response.body)['user']['id']).to eq(user.id)
      expect(JSON(response.body)['user']['first_name']).to eq(user.first_name)
      expect(JSON(response.body)['user']['last_name']).to eq(user.last_name)
      expect(JSON(response.body)['user']['email']).to eq(user.email)
    end

    it 'renders a JSON response with the content type' do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end
end
