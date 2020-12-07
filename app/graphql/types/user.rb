module Types
  class User < Types::BaseObject
    field :id, ID, null: false
    field :comments, [Types::Comment], null: false
    field :name, String, null: false
    field :email, String, null: false
  end
end
