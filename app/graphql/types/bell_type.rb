module Types
  class BellType < Types::BaseObject
    field :id, ID, null: false
    field :place, String, null: true
    field :password, String, null: true
    field :note, String, null: true
    field :tweet_uri, String, null: true
    field :messages, [MessageType], null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
