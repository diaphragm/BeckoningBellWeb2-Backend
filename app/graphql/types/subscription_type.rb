module Types
  class SubscriptionType < Types::BaseObject
    extend GraphQL::Subscriptions::SubscriptionRoot

    field :new_message, Types::MessageType, null: true,
                                            description: 'A message was posted to the bell' do
      argument :bell_id, ID, required: true
    end

    def new_message(bell_id:)
      Bell.find(bell_id).messages.last
    end

    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end
  end
end
