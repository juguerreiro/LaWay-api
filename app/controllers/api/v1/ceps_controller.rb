module Api
  module V1
    class CepsController < Api::V1::BaseController
      acts_as_token_authentication_handler_for User
      require "pry-byebug"
      def index
        @ceps = policy_scope(Cep)
        binding.pry
      end

      def create
        cep_user = params[:cep]
        user = current_user
        cep = CepCreator.new(cep: cep_user, user: user).create_cep
        authorize cep
        cep.save
      end
    end
  end
end
