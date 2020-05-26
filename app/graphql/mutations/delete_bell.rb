module Mutations
  class DeleteBell < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :bell, Types::BellType, null: true

    # TODO: define arguments
    # argument :name, String, required: true
    argument :id, ID, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    def resolve(**args)
      bell = Bell.find(args[:id])
      bell.delete_logical
      {
        bell: bell
      }
    end
  end
end
