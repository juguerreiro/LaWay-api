module Api
  module V1
    class CepsController < Api::V1::BaseController
      require "pry-byebug"
      acts_as_token_authentication_handler_for User
      def index
        binding.pry
        @ceps = policy_scope(Cep)
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
