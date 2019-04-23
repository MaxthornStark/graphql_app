class GraphqlAppSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  max_depth 10
end
