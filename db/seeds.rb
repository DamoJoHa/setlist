# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new
user.username = "owner"
user.email = "owner@test.mail"
user.password = "password"
user.save

artist = User.new
artist.username = "artist"
artist.email = "artist@test.mail"
artist.password = "password"
artist.save

act = Act.new
act.name = "Blazing Glory"
act.description = "A new group with an old sound, playing all the songs you love."
act.genre = "Rock"
act.user = artist
act.save

venue = Venue.new
venue.address = "Somewhere"
venue.description = "A real dump."
venue.name = "The Chum Bucket"
venue.category = "restaurant"
venue.user = user
venue.save

event = Event.new
event.start_time = Time.now
event.end_time = Time.now + 100
event.description = "Blazing GLory at the Chum Bucket"
event.act = act
event.venue = venue
event.save
