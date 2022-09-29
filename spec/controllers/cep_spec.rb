require "rails_helper"
require "pry-byebug"

RSpec.describe Api::V1::CepsController, type: :controller do
  before(:all) do
    user = create(:user)
    @user_token = user.authentication_token
    # request.headers['Content-Type'] = "application/json"
    # request.headers['X-User-Email'] = "user2@test.com"
    # request.headers['X-User-Token'] = user_token
  end

  describe 'CEPs API', type: :request do
    describe 'GET /ceps' do
      it 'return all ceps' do
        get '/api/v1/ceps', headers: { "Content-Type": "application/json", 'X-User-Email': "user2@test.com", 'X-User-Token': @user_token }
        expect(response).to have_http_status(:success)
      end
    end
    describe 'POST /ceps' do
      it 'create a new cep' do
        expect {
          post '/api/v1/ceps', params: {code: {cep: "22222-000"}}
        }.to change Cep.count.by(1)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
