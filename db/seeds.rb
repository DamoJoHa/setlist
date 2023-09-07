# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# The code below used real, somewhat random addresses.  Maybe nice at a future time, but for now its a pain in the butt.

# require "csv"
# filepath = "storage/NYData.csv"
# ADDRESSES = []
# CSV.foreach(filepath, headers: :first_row) do |row|
#   if row['Address State'] == "NY" && row['Address City']
#     ADDRESSES.push("#{row['Address Building']}, #{row['Address Street Name']}, #{row['Address City']}, NY, #{row['Address ZIP']}")
#   end
# end

ADDRESSES = ["68-04 Burns St, Queens, NY 11375, United States", "97-26 63rd Rd, Rego Park, NY 11374, United States", "82-80 Broadway, Queens, NY 11373, United States", "150 Nassau St, New York, NY 10038, United States", "25 Murray Street, New York, NY 10007, United States", "385 Greenwich St, New York, NY 10013, United States", "144 2nd Ave, New York, NY 10003, United States", "149 W 14th St, New York, NY 10011, United States", "210 10th Ave, New York, NY 10011, United States", "1900 Broadway, New York, NY 10023, United States", "1590 2nd Ave, New York, NY 10028, United States", "351 E 103rd St, New York, NY 10029, United States", "1207 Amsterdam Ave, New York, NY 10027, United States"]

GENRES = ["Rock", "R&B", "Pop", "Acoustic"]
CATEGORIES = ["Restaurant", "Bar", "Cafe"]

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
  act.name = Faker::TvShows::RickAndMorty.character
  act.description = Faker::Books::Lovecraft.paragraph(sentence_count: 4)
  act.genre = GENRES.sample
  act.user = user
  act.save
  puts "Act created for #{user.username}"
end
puts "................................"

USERS = User.all
puts "Creating Venues"
ADDRESSES.each_with_index do |address, index|
  venue = Venue.new
  venue.address = address
  venue.description = Faker::Lorem.paragraphs
  venue.name = Faker::Restaurant.name
  venue.category = CATEGORIES.sample
  venue.user = USERS.sample
  venue.save
  unless venue.geocoded?
    puts "Address error at index " + index
  end
  puts "Venue #{venue.name} created for #{venue.user.username}"
end
puts "................................"

puts "Creating Events"

ACTS = Act.all
Venue.all.each do |venue|
  hour_ran = (12..20).to_a
  ran = [0, 1, 2]
  ran.sample.times do
    event = Event.new
    days = ran.sample * 86_400
    hours = hour_ran.sample * 3600
    event.start_time = Date.today.to_time + days + hours
    event.end_time = event.start_time + 7200
    event.act = ACTS.sample
    event.venue = venue
    event.description = Faker::Books::Lovecraft.paragraph(sentence_count: 4)
    event.title = Faker::Book.title
    event.save
    puts "Event '#{event.title}' created"
  end
end

puts "DONE"
