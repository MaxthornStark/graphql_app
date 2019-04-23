module Resolvers
  class WeaponResolver < BaseResolver
    def resolve(args)
      @args = args
      authorize!
      scope
    end

    private

    attr_reader :args

    def authorize!
      not_authorized! unless WeaponPolicy.new(current_user, scope).show?
    end

    def scope
      Weapon.find_by(uuid: args[:uuid])
    end
  end
end
