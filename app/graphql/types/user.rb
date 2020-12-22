module Types
  class User < Types::BaseObject
    field :id, ID, null: false
    field :comments, [Types::Comment], null: false
    field :name, String, null: false
    field :email, String, null: false

    def comments
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        ::Comment.where(user_id: ids).each do |comment|
          loader.call(comment.user_id) { |memo| memo << comment }
        end
      end
    end
  end
end
