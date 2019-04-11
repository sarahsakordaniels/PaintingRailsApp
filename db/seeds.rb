# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Painting.destroy_all
Artist.destroy_all

monet = Artist.create(name:"Monet", style:"Impressionist")
picasso = Artist.create(name:"Picasso", style:"Abstract")
pollock = Artist.create(name:"Pollock", style:"Abstract")

Painting.create(name:"Water Lillies", artist: monet)
Painting.create(name:"Scream", artist: picasso)
Painting.create(name:"Splashes", artist: pollock)
Painting.create(name:"Starry Night", artist: picasso)
