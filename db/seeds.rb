# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#generating 15 random super_powers
15.times do
  hero_power = HeroPower.create(
      power_id: rand(1..5),
      hero_id: rand(1..10),
      strength: ['strong', 'weak', 'average'].sample,

  )
end

#generating 15 random powers
15.times do
  power = Power.create(
    name: Faker::Superhero.power,
    description: Faker::Lorem.sentence
  )
end

# generating 15 random heroes
15.times do
  hero = Hero.create(
      name: Faker::Superhero.name,
      super_name: Faker::Superhero.descriptor
  )
end
