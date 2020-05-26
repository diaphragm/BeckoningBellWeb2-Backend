module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :bell, BellType, null: true do
      description 'Find a bell by ID'
      argument :id, ID, required: true
    end
    def bell(id:)
      Bell.find(id)
    end

    field :bells, [BellType], null: false
    def bells
      Bell.available
    end

    field :dev, String, null: true
    def dev
      {object: @object, context: @context}.to_json
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end
  end
end
