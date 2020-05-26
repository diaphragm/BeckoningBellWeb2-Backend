module Mutations
  class UpdateBell < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :bell, Types::BellType, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :id, ID, required: true
    argument :place, String, required: false
    argument :password, String, required: false
    argument :note, String, required: false
    argument :tweet_uri, String, required: false

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    def resolve(**args)
      bell = Bell.find(args[:id])
      bell.update(args)
      {
        bell: bell
      }
    end
  end
end
