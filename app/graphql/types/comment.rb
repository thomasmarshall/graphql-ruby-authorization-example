module Types
  class Comment < Types::BaseObject
    field :id, ID, null: false
    field :post, Types::Post, null: false
    field :user, Types::User, null: false
    field :body, String, null: false
    field :moderation_status, Types::ModerationStatus, null: true
  end
end
