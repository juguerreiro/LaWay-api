class Api::V1::CepsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  def index
    @ceps = policy_scope(Cep)
  end

  def create
    cep_user = params[:cep]
    url = "https://cdn.apicep.com/file/apicep/#{cep_user}.json"

    response = RestClient.get(url)
    repos = JSON.parse(response)
    user = current_user

    cep = Cep.new(
      code: repos["code"],
      state: repos["state"],
      city: repos["city"],
      district: repos["district"],
      address: repos["address"],
      user: user
    )

    authorize cep
    cep.save
  end
end
