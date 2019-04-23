# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GraphqlToken.create(key: 'very_secret_token')

Weapon.create(uuid: SecureRandom.hex(16), name: 'sword', attack: 11)

Warrior.create(uuid: SecureRandom.hex(16), name: 'Iron Man', descent: 'Earth', weapon: Weapon.first)
Warrior.create(uuid: SecureRandom.hex(16), name: 'Thor', descent: 'Asgard', weapon: Weapon.first)
Warrior.create(uuid: SecureRandom.hex(16), name: 'Hulk', descent: 'Earth', weapon: Weapon.first)
Warrior.create(uuid: SecureRandom.hex(16), name: 'Loki', descent: 'Asgard', weapon: Weapon.first)
Warrior.create(uuid: SecureRandom.hex(16), name: 'Captain America', descent: 'Earth', weapon: Weapon.first)

# added during presentation
Warrior.create(uuid: SecureRandom.hex(16), name: 'Thanos', weapon: Weapon.first)

Weapon.create(uuid: SecureRandom.hex(16), name: 'legendarna cebula zaglady', attack: 999, legendary: true)
Warrior.create(uuid: SecureRandom.hex(16), name: 'Janusz', descent: 'Earth', weapon: Weapon.find_by(name: 'legendarna cebula zaglady'))

puts 'seed finished'
