module Types
  class MutationType < Types::BaseObject
    field :post_message, mutation: Mutations::PostMessage
    field :delete_bell, mutation: Mutations::DeleteBell
    field :update_bell, mutation: Mutations::UpdateBell
    field :create_bell, mutation: Mutations::CreateBell

    # TODO: remove me
    field :test_field, String, null: false, description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
