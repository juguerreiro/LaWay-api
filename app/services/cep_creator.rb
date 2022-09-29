class CepCreator
  def initialize(attr = {})
    @cep = attr[:cep]
    @user = attr[:user]
  end

  def create_cep
    response = RestClient.get("https://cdn.apicep.com/file/apicep/#{@cep}.json")
    repos = JSON.parse(response)

    Cep.new(
      code: repos["code"],
      state: repos["state"],
      city: repos["city"],
      district: repos["district"],
      address: repos["address"],
      user: @user
    )
  end
end
