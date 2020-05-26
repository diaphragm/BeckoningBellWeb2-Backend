module Mutations
  class PostMessage < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :message, Types::MessageType, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :bell_id, ID, required: true
    argument :user, String, required: false
    argument :body, String, required: false

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    def resolve(**args)
      bell = Bell.available.find(args[:bell_id])
      message = bell.messages.create(args)
      {
        message: message
      }
    end
  end
end
