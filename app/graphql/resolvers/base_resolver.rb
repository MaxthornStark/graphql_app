module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    def not_authorized!
      raise GraphQL::ExecutionError, 'Not authorized to show object'
    end

    def current_user
      context[:current_user]
    end
  end
end
