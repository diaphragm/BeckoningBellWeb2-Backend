module Mutations
  class CreateBell < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :bell, Types::BellType, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :place, String, required: true
    argument :password, String, required: true
    argument :note, String, required: false
    argument :tweet_uri, String, required: false

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    def resolve(**args)
      bell = Bell.create(args)
      {
        bell: bell
      }
    end
  end
end
