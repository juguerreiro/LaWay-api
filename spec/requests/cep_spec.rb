require 'rails_helper'
require "pry-byebug"

RSpec.describe Api::V1::CepsController, type: :controller do
  user = User.create!(
    email: "user10@test.com",
    password: "123456"
  )
  user_token = user.authentication_token

  before do
    request.headers['Content-Type'] = "application/json"
    request.headers['X-User-Email'] = "user2@test.com"
    request.headers['X-User-Token'] = user_token
  end

  describe 'CEPs API', type: :request do
    describe 'GET /ceps' do
      it 'return all ceps' do
        get '/api/v1/ceps'
        expect(response).to have_http_status(:success)
      end
    end
    describe 'POST /ceps' do
      it 'create a new cep' do
        expect {
          post '/api/v1/ceps', params: {code: {cep: "22222-000"}}
        }.to change { Cep.count }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
