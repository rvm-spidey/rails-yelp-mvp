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

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample(1)[0]
  )
  restaurant.save!
  puts "Created #{restaurant.name}"

  review = Review.new(
    content: Faker::Superhero.name,
    rating: rand(0..5)
  )
  review.restaurant = restaurant
  review.save!
end
