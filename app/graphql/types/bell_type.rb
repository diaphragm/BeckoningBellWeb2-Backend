module Types
  class BellType < Types::BaseObject
    field :place, Types::StringType, null: true
    field :password, Types::StringType, null: true
    field :tweet_uri, Types::StringType, null: true
    field :messages, [Types::MessageType], null: true
  end
end
