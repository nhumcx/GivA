class ReviewPolicy < ApplicationPolicy
  # class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    # end
  # end

  def create?
    user.displaced && !record.buddy.receiver.displaced
  end

  def new?
    create?
  end
end
