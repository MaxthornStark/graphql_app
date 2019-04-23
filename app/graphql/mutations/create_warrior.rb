module Mutations
  class CreateWarrior < BaseMutation
    null false

    argument :name, String, required: true
    argument :descent, String, required: false
    argument :weapon_uuid, String, required: false

    field :warrior, Types::WarriorType, null: true
    field :errors, [String], null: false

    def resolve(args)
      authorize
      @args = args

      warrior = Warrior.create(warrior_params)

      if warrior.errors.empty?
        successful_response(warrior)
      else
        failure_response(warrior.errors)
      end
    end

    private

    attr_reader :args

    def authorize
      not_authorized unless WarriorPolicy.new(context[:current_user], Warrior).create?
    end

    def warrior_params
      {
        uuid: uuid, name: args[:name], descent: args[:descent], weapon: weapon
      }
    end

    def uuid
      SecureRandom.hex(16)
    end

    def weapon
      if args[:weapon_uuid]
        Weapon.find_by(uuid: args[:weapon_uuid])
      else
        Weapon.find_by(name: 'sword')
      end
    end

    def successful_response(warrior)
      {
        warrior: warrior,
        errors: []
      }
    end

    def failure_response(errors)
      {
        warrior: nil,
        errors: errors
      }
    end
  end
end
