require 'faker'

puts "Cleaning database"

Suggestion.destroy_all
Category.destroy_all

puts "Creating categories"

admin = User.create(
  first_name: "Admin",
  last_name: "Smit",
  email: "admin@email.com",
  password: "password"
)

puts "Created admin to login with: email #{admin.email}, password: 'password'}"

puts "Creating categories"

category  = Category.create!(title: 'Dining', icon: 'fa-solid fa-utensils')
puts "Created #{category.title}"

category  = Category.create!(title: 'Drinks', icon: 'fa-solid fa-champagne-glasses')
puts "Created #{category.title}"

category  = Category.create!(title: 'Nightlife', icon: 'fa-solid fa-music')
puts "Created #{category.title}"

category  = Category.create!(title: 'Adventure & Active', icon: 'fa-solid fa-bicycle')
puts "Created #{category.title}"

category  = Category.create!(title: 'Outdoor & Nature', icon: 'fa-solid fa-tree')
puts "Created #{category.title}"

category  = Category.create!(title: 'Entertainment', icon: 'fa-solid fa-film')
puts "Created #{category.title}"

category  = Category.create!(title: 'Cultural', icon: 'fa-solid fa-people-arrows')
puts "Created #{category.title}"

category  = Category.create!(title: 'Creative', icon: 'fa-solid fa-palette')
puts "Created #{category.title}"

category  = Category.create!(title: 'Relaxation & Wellness', icon: 'fa-solid fa-spa')
puts "Created #{category.title}"

category  = Category.create!(title: 'Romantic', icon: 'fa-regular fa-face-grin-hearts')
puts "Created #{category.title}"

category  = Category.create!(title: 'Learning', icon: 'fa-solid fa-lines-leaning')
puts "Created #{category.title}"

category  = Category.create!(title: 'Unique', icon: 'fa-regular fa-lightbulb" style="color: #42ff68;')
puts "Created #{category.title}"



puts "Creating suggestions"

10.times do
  random_number = rand(1..10)
  file_name = "food-0#{random_number}.jpg"
  suggestion = Suggestion.create!(
    title: Faker::Restaurant.name,
    overview: Faker::Restaurant.description,
    longitude: 4.897070,
    latitude: 52.377956,
    category: Category.all.sample,
    image_url: file_name
  )
  puts "Created #{suggestion.title}"
end

puts "Finished!"
