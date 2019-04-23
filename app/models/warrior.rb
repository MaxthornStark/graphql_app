class Warrior < ApplicationRecord
  # alias_attribute :born_at, :created_at
  belongs_to :weapon
end