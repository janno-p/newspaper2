# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Newspaper.create([
  { name: 'Eesti Päevaleht', founded_at: Date.civil(1905, 12, 16) },
  { name: 'Postimees', founded_at: Date.civil(1857, 6, 5) },
  { name: 'The New York Times', founded_at: Date.civil(1851, 9, 18) }
])
