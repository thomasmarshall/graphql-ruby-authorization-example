module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :body, String, required: true
    argument :post_id, ID, required: true

    field :comment, Types::Comment, null: false

    def resolve(body:, post_id:)
      post = ::Post.find(post_id)
      user = context[:current_user]

      comment = post.comments.build(body: body, user: user)
      comment.save!

      { comment: comment }
    end
  end
end
