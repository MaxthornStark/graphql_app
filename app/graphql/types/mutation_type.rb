module Types
  class MutationType < Types::BaseObject
    field :create_warrior, 'Creates new warrior.', mutation: Mutations::CreateWarrior
    field :create_weapon, 'Creates new weapon.', mutation: Mutations::CreateWeapon
    field :kill_thanos, 'Kills ultimate enemy..', mutation: Mutations::KillThanos
  end
end
