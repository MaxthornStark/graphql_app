class Mutations::BaseMutation < GraphQL::Schema::Mutation

  def current_user
    context[:current_user]
  end

  def raise_error(msg)
    raise GraphQL::ExecutionError, msg
  end

  def not_authorized
    raise GraphQL::ExecutionError, "Unauthorized to perform #{self.class.name.demodulize}"
  end
end
