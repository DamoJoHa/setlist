# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Starting Cleanup"
Event.delete_all
Act.delete_all
Venue.delete_all
User.delete_all
p "Cleanup Successful"
p ""

p "Creating Users"
user = User.new
user.username = "owner"
user.email = "owner@test.mail"
user.password = "password"
user.save
p "Owner created (1/3)"

artist = User.new
artist.username = "artist"
artist.email = "artist@test.mail"
artist.password = "password"
artist.save
p "Artist created (2/3)"

artist2 = User.new
artist2.username = "dave"
artist2.email = "dave@test.mail"
artist2.password = "password"
artist2.save
p "Artist2 created (3/3)"
p ""

p "Creating Acts"
act = Act.new
act.name = "Blazing Glory"
act.description = "A new group with an old sound, playing all the songs you love."
act.genre = "Rock"
act.user = artist
act.save
p "Created Blazing Glory (1/2)"

act2 = Act.new
act2.name = "Jewel's Fern"
act2.description = "Technosynth nightmares."
act2.genre = "Electronic"
act2.user = artist2
act2.save
p "Created Jewel's Fern (2/2)"
p ""

p "Creating Venue"
venue = Venue.new
venue.address = "48 Main St, Warwick, NY"
venue.description = "Dog friendly, with classic american favorites."
venue.name = "Fetch"
venue.category = "restaurant"
venue.user = user
venue.save
p "Venue 1 Created"

p "Creating Venue"
venue2 = Venue.new
venue2.address = "5 1/2 South St, Warwick, NY 10990, United States"
venue2.description = "Coffee, sweets, breakfasts and wraps."
venue2.name = "Tuscan Cafe"
venue2.category = "cafe"
venue2.user = user
venue2.save
p "Venue 2 Created"
p ""

p "Creating Events"
event = Event.new
event.start_time = Time.now
event.title = "New Year's Show"
event.end_time = Time.now + 100
event.description = "Blazing Glory at the Tuscan"
event.act = act
event.venue = venue2
event.save

event2 = Event.new
event2.start_time = Time.now + 10000
event2.title = "The Hangover"
event2.end_time = Time.now + 11000
event2.description = "Let your ears bleed to the sounds of a dozen beached whales dying."
event2.act = act2
event2.venue = venue
event2.save
p "Events Created"
p "Done"
