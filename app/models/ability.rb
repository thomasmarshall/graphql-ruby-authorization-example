# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :moderate, Comment, { user_id: user.id }
  end
end
