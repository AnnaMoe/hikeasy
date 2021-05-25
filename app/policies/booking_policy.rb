class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(user: user)
    end

    private

    attr_reader :user, :scope
  end

  def create?
    true
  end

  def update?
    true
  end

  def show?
    true
  end

  def confirmation?
    true
  end

  def chatroom?
    true
  end
end
