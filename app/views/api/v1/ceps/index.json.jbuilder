json.array! @ceps do |cep|
  json.extract! cep, :id, :code, :state, :city, :district, :address, :user_id
end
