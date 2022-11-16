# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
tour_dargent = {name: "La Tour D'argent", address: "Avenue des champs Elysées, Paris", category: "french", phone_number: "+33 1 24 52 32 21"}
cigale  = {name: "La cigale", address: "1, place graslin, Nantes", category: "french", phone_number: "+33 2 24 57 23 12"}
mamamia  = {name: "Mamamia", address: "Rome", category: "italian", phone_number: "+38 22 48 16 44"}
izakaya  = {name: "Izakaya Joyi", address: "20 rue de la madelaine, Nantes", category: "japanese", phone_number: "+33 2 29 41 16 44"}
bexpress  = {name: "The B express", address: "22 rue de la Gustave, Nantes", category: "belgian", phone_number: "+33 2 12 13 14 11"}

[tour_dargent, cigale, mamamia, izakaya, bexpress].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end

review_cigale = Review.new(content: "Super", rating: 2)
la_cigale = Restaurant.find_by(name: "La cigale")
review_cigale.restaurant = la_cigale
review_cigale.save!
puts "Finished!"

review_tour_dargent = Review.new(content: "Perfect but very expensive", rating: 3)
la_tour_dargent = Restaurant.find_by(name: "La Tour D'argent")
review_tour_dargent.restaurant = la_tour_dargent
review_tour_dargent.save!
puts "Finished!"
