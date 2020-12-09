module Types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument

    def authorized?(object, args, context)
      authorize === [false]
    end
  end
end
