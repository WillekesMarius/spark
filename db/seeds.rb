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

categories = ['Dining', 'Drinks', 'Nightlife', 'Adventure & Active', 'Outdoor & Nature', 'Entertainment', 'Cultural', 'Creative', 'Relaxation & Wellness', 'Romantic', 'Learning', 'Unique']
icons = ['fa-solid fa-utensils', 'fa-solid fa-champagne-glasses', 'fa-solid fa-music', 'fa-solid fa-bicycle', 'fa-solid fa-tree', 'fa-solid fa-film', 'fa-solid fa-people-arrows', 'fa-solid fa-palette', 'fa-solid fa-spa', 'fa-regular fa-face-grin-hearts', 'fa-solid fa-lines-leaning', 'fa-regular fa-lightbulb" style="color: #42ff68;']

categories.each_with_index do |name, index|
  category = Category.create!(title: name, icon: icons[index])
  puts "Created #{category.title}"
end

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
