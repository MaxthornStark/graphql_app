Types::Scalars::DateType = GraphQL::ScalarType.define do
  name 'Date'
  description "Represents date type of ISO 8601 standard"

  coerce_input ->(val, _ctx) { val.to_date }
  coerce_result ->(val, _ctx) { val.to_s }
end
