# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"
filepath = "storage/NYData.csv"
ADDRESSES = []
CSV.foreach(filepath, headers: :first_row) do |row|
  if row['Address State'] = "NY" && !row['Addrewss City'].empty?
    ADDRESSES.push("#{row['Address Building']}, #{row['Address Street Name']}, #{row['Adress City']}, NY, #{row['Address ZIP']}")
  end
end

GENRES = ["Rock", "R&B", "Pop"]

puts "Starting Cleanup"
Event.delete_all
Act.delete_all
Venue.delete_all
User.delete_all
puts "Cleanup Successful"
puts "................................"

puts "Creating Users & Acts"
owner = User.new
owner.username = "owner"
owner.email = "owner@mail.com"
owner.password = "password"
owner.save
puts "Created owner account"
14.times do
  user = User.new
  user.username = Faker::Name.name
  user.email = Faker::Internet.email
  user.password = "password"
  user.save
  puts "#{user.username} Created"
  act = Act.new
  act.name = Faker::Music::RockBand.name
  act.description = Faker::Quotes::Shakespeare.hamlet_quote
  act.genre = GENRES.sample
  act.user = user
  act.save
  puts "Act created for #{user.username}"
end
puts "................................"

puts "Creating Venues"
User.last(5).each do |user|
  venue = Venue.new
  venue.address = ADDRESSES.sample
  venue.description = Faker::Quote.yoda
  venue.name = Faker::Restaurant.name
  venue.category = "restaurant"
  venue.user = user
  venue.save
  until venue.geocoded?
    puts "Trying new venue"
    venue.address = ADDRESSES.sample
    venue.save
  end
  puts "Venue #{venue.name} created for #{user.username}"
end
puts "................................"

puts "Creating Events"

ACTS = Act.all
Venue.all.each do |venue|
  ran = [1, 2, 3, 4].sample
  ran.times do
    event = Event.new
    event.start_time = rand(10.hours).seconds.from_now
    event.end_time = event.start_time + 20000
    event.act = ACTS.sample
    event.venue = venue
    event.description = Faker::Quote.famous_last_words
    event.title = "#{event.act.name} at #{event.venue.name}"
    event.save
    puts "Event '#{event.title}' created"
  end
end

puts "DONE"
