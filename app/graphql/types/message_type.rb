module Types
  class MessageType < Types::BaseObject
    field :user, Types::StringType, null: true
    field :body, Types::StringType, null: true
  end
end
