module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::Post], null: false

    def posts
      ::Post.all
    end

    field :users, [Types::User], null: false

    def users
      ::User.all
    end
  end
end
