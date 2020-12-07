module Types
  class Post < Types::BaseObject
    field :id, ID, null: false
    field :comments, [Types::Comment], null: false
    field :title, String, null: false
    field :body, String, null: false
  end
end
