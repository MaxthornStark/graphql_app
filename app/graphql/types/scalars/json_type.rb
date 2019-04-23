Types::Scalars::JsonType = GraphQL::ScalarType.define do
  name 'JSON'
  description 'Represents JSON type'

  coerce_input ->(val, _ctx) { JSON.parse(val) }
  coerce_result ->(val, _ctx) { JSON.dump(val) }
end
