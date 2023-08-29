require 'faker'

puts "Cleaning database"
Category.destroy_all
Suggestion.destroy_all

puts "Creating categories"

admin = User.create(
  first_name: "Admin",
  last_name: "Smit",
  email: "admin@email.com",
  password: "password"
)

puts "Created admin to login with: email #{admin.email}, password: 'password'}"

puts "Creating categories"

3.times do
  category = Category.create!(title: Faker::Restaurant.type)
  puts "Created #{category.title}"
end

puts "Creating suggestions"

10.times do
  suggestion = Suggestion.create!(
    title: Faker::Restaurant.name,
    overview: Faker::Restaurant.description,
    longitude: 4.897070,
    latitude: 52.377956,
    category: Category.all.sample
  )
  puts "Created #{suggestion.title}"
end

puts "Finished!"
