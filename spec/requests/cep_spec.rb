require "rails_helper"
require "pry-byebug"

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
end

RSpec.describe Api::V1::CepsController, type: :request do
  before(:all) do
    @user = create(:user)
    sign_in @user
    @user_token = @user.authentication_token
  end

  describe 'GET /ceps' do
    # before do
    #   request.headers['Content-Type'] = "application/json"
    # end
    it 'return all ceps' do
      # request.headers['Content-Type'] = "application/json"
      # request.headers['X-User-Email'] = "user2@test.com"
      # request.headers['X-User-Token'] = @user_token

      get :index, to: "ceps#index"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /ceps' do
    it 'create a new cep' do
      expect {
        post :create, to: "ceps#create", params: {code: {cep: "22222-000"}}
      }.to change { Cep.count }.by(1)
      expect(response).to have_http_status(:success)
    end
  end
end
