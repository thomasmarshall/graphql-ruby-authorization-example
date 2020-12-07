module Types
  class ModerationStatus < Types::BaseEnum
    ::Comment.moderation_statuses.values.map(&method(:value))
  end
end
