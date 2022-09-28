class CepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user ? scope.where(user: user) : scope.all
    end
  end

  def create?
    true
  end
end
