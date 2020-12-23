module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField

    def self.actionable
      actionable_name = "#{graphql_name}Action"
      actionable_type = Class.new(Types::BaseEnum) do
        graphql_name actionable_name
      end

      yield actionable_type

      field :can, Boolean, null: false do
        argument :action, actionable_type, required: true
      end

      def can(action:)
        context[:current_ability].can?(action, object)
      end

      field :authorize, self, null: true do
        argument :action, actionable_type, required: true
      end

      def authorize(action:)
        object if context[:current_ability].can?(action, object)
      end
    end
  end
end
