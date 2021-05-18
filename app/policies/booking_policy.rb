class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    # def new?
    #   true
    # end

   
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
end
