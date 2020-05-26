module Types
  class MessageType < Types::BaseObject
    field :user, String, null: true
    field :body, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
