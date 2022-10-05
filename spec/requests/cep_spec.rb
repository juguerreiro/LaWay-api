require "rails_helper"
require "pry-byebug"

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
end

RSpec.describe Api::V1::CepsController, type: :request do
  before(:all) do
    @user = create(:user)
    @params = { user_email: @user.email, user_token: @user.authentication_token }
  end

  describe 'GET /ceps' do
    it 'Return success for all ceps' do
      get api_v1_ceps_path(@params)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /ceps' do
    it 'Create a new cep' do
      expect {
        post api_v1_ceps_path(@params), params: @params.merge({ cep: "87013-010" })
      }.to change { Cep.count }.by(1)

      cep = Cep.order(:created_at).last
      expect(cep.code).to eq("87013-010")
      expect(response).to have_http_status(:success)
    end
  end
end
