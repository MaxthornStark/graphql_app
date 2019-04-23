class Types::WarriorType < Types::BaseObject
  description 'Warrior info.'

  field :uuid, String, null: false
  field :name, String, null: false
  field :descent, String, null: true
  field :born_at, GraphQL::Types::ISO8601DateTime, method: :created_at, null: false
  field :weapon, Types::WeaponType, null: true
end
