module Types
  class QueryType < Types::BaseObject
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :field1, GraphQL::Types::ISO8601DateTime, 'some test field', null: false

    def field1
      Time.current
    end

    field :weapons, [Types::WeaponType], 'List of weapons', null: false,
          resolve: ->(_obj, _args, _ctx) { Weapon.all }

    field :weapon_list, [Types::WeaponType], 'List of weapons', null: false,
          resolver: Resolvers::WeaponsListResolver

    field :weapon_list_list, [Types::WeaponType], 'List of weapons', null: false

    def weapon_list_list
      Weapon.all
    end

    field :weapon, Types::WeaponType, 'Single weapon', resolver: Resolvers::WeaponResolver, null: false do
      argument :uuid, String, required: true
    end

    field :warriors_list, [Types::WarriorType], 'List of warriors', null: false

    def warriors_list
      Warrior.all
    end
  end
end
