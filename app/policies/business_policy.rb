class BusinessPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def update?
    user.businesses.where(id: record.id).any?
  end

  def destroy?
    user.businesses.where(id: record.id).any?
  end
end
