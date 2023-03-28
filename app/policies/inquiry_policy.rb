class InquiryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    record.airplane.user == user || record.user == user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    record.user == user || record.airplane.user == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user || record.airplane.user == user
  end

end
