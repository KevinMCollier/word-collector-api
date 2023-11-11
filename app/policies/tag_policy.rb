class TagPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.joins(:flashcards).where(flashcards: { user_id: user.id }).distinct
    end
  end

  def show?
    user.flashcards.joins(:tags).exists?(tags: { id: record.id })
  end
end
