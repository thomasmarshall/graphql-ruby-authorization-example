module Types
  class Post < Types::BaseObject
    field :id, ID, null: false
    field :comments, [Types::Comment], null: false
    field :title, String, null: false
    field :body, String, null: false

    def comments
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        ::Comment.where(post_id: ids).each do |comment|
          loader.call(comment.post_id) { |memo| memo << comment }
        end
      end
    end
  end
end
