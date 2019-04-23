class Types::WeaponType < Types::BaseObject
  description 'Weapon info.'

  field :uuid, String, null: false
  field :name, String, null: false
  field :attack, Integer, null: false
  field :is_legendary, Boolean, method: :legendary, null: false
  field :warriors_count, Integer, null: false

  def warriors_count
    object.warriors.count
  end
end
