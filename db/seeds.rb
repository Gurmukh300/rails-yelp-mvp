require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all

50.times do
  restaurant = Restaurant.new(name: Faker::Restaurant.name,
                              address: Faker::Address.full_address,
                              phone_number: Faker::Number.number(digits: 10),
                              category: ["Chinese", "Italian", "Japanese", "French", "Belgian"].sample
                            )
  restaurant.save

  review = Review.new(restaurant_id: restaurant.id,
                      rating: rand(0..5),
                      content: Faker::Restaurant.review)

  if review.valid?
    review.save
  else
    puts review.errors.messages
  end
end
puts "all done"
