module Mutations
  class CreateWeapon < BaseMutation
    null false

    argument :name, String, required: true
    argument :attack, Integer, required: false
    argument :legendary, Boolean, required: false

    field :weapon, Types::WeaponType, null: true
    field :errors, [String], null: false

    def resolve(args)
      authorize
      @args = args

      weapon = Weapon.create(weapon_params)

      if weapon.errors.empty?
        successful_response(weapon)
      else
        failure_response(weapon.errors)
      end
    end

    private

    attr_reader :args

    def authorize
      not_authorized unless WeaponPolicy.new(context[:current_user], Weapon).create?
    end

    def weapon_params
      {
        uuid: uuid, name: args[:name], legendary: args[:legendary], attack: args[:attack]
      }
    end

    def uuid
      SecureRandom.hex(16)
    end

    def successful_response(weapon)
      {
        weapon: weapon,
        errors: []
      }
    end

    def failure_response(errors)
      {
        weapon: nil,
        errors: errors
      }
    end
  end
end
