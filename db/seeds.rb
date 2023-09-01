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

api_key = ENV['GOOGLE_API_KEY']
query = 'cocktail%20bars%20in%20Amsterdam'

api_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&key=#{api_key}"
data = HTTParty.get(api_url)
results = data["results"]

results.each do |result|
  place_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{result["place_id"]}&key=#{api_key}"
  place = HTTParty.get(place_url)
  place = JSON.parse(place.body)

  photo_references = []
  photos = place["result"]["photos"]

  if photos
    photos.each do |photo|
      photo_reference = photo["photo_reference"]
      photo_references << "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_reference}&key=#{api_key}"
    end
  end

  suggestion = Suggestion.create!(
    title: result["name"],
    overview: Faker::Restaurant.description,
    longitude: result["geometry"]["location"]["lng"],
    latitude: result["geometry"]["location"]["lat"],
    category: Category.find_by(title: "Drinks"),
    image_url: "",
    images: photo_references,
    rating: result["rating"],
    total_ratings: result["user_ratings_total"],
    sub_category: "Cocktail"
  )
  puts "Created #{suggestion.title}"
end

query = 'italian%20restaurants%20in%20Amsterdam'
api_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&key=#{api_key}"
data = HTTParty.get(api_url)
results = data["results"]

results.each do |result|
  place_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{result["place_id"]}&key=#{api_key}"
  place = HTTParty.get(place_url)
  place = JSON.parse(place.body)

  photo_references = []
  photos = place["result"]["photos"]

  if photos
    photos.each do |photo|
      photo_reference = photo["photo_reference"]
      photo_references << "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_reference}&key=#{api_key}"
    end
  end

  suggestion = Suggestion.create!(
    title: result["name"],
    overview: Faker::Restaurant.description,
    longitude: result["geometry"]["location"]["lng"],
    latitude: result["geometry"]["location"]["lat"],
    category: Category.find_by(title: "Dining"),
    image_url: "",
    images: photo_references,
    rating: result["rating"],
    total_ratings: result["user_ratings_total"],
    sub_category: "Italian"
  )
  puts "Created #{suggestion.title}"
end

query = 'asian%20restaurants%20in%20Amsterdam'
api_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&key=#{api_key}"
data = HTTParty.get(api_url)
results = data["results"]

results.each do |result|
  place_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{result["place_id"]}&key=#{api_key}"
  place = HTTParty.get(place_url)
  place = JSON.parse(place.body)

  photo_references = []
  photos = place["result"]["photos"]

  if photos
    photos.each do |photo|
      photo_reference = photo["photo_reference"]
      photo_references << "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_reference}&key=#{api_key}"
    end
  end

  suggestion = Suggestion.create!(
    title: result["name"],
    overview: Faker::Restaurant.description,
    longitude: result["geometry"]["location"]["lng"],
    latitude: result["geometry"]["location"]["lat"],
    category: Category.find_by(title: "Dining"),
    image_url: "",
    images: photo_references,
    rating: result["rating"],
    total_ratings: result["user_ratings_total"],
    sub_category: "Asian"
  )
  puts "Created #{suggestion.title}"
end

puts "Finished!"
