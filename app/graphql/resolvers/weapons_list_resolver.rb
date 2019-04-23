module Resolvers
  class WeaponsListResolver < BaseResolver
    def resolve
      authorize!
      scope
    end

    private

    def authorize!
      not_authorized! unless WeaponPolicy.new(current_user, scope).index?
    end

    def scope
      Weapon.all
    end
  end
end
