require 'faker'
require_relative("date_ideas/amsterdam")
require_relative("date_ideas/rotterdam")
require_relative("date_ideas/the_hague")

API_KEY = ENV['GOOGLE_API_KEY']

def google_results(query)
  api_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&key=#{API_KEY}"
  data = HTTParty.get(api_url)
  return data["results"]
end

def get_photo_references(place)
  photo_references = []
  photos = place["result"]["photos"]

  if photos
    photos.each do |photo|
      photo_reference = photo["photo_reference"]
      photo_references << "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_reference}&key=#{API_KEY}"
    end
  end
  return photo_references
end

def seed_database_google(result, photo_references, city, category, sub_category)
  suggestion = Suggestion.create!(
    title: result["name"],
    overview: Faker::Restaurant.description,
    longitude: result["geometry"]["location"]["lng"],
    latitude: result["geometry"]["location"]["lat"],
    images: photo_references,
    rating: result["rating"],
    total_ratings: result["user_ratings_total"],
    address: result["formatted_address"],
    city: city,
    category: Category.find_by(title: category),
    sub_category: sub_category
  )
  puts "Created #{suggestion.title}"
end

def create_suggestions(query, city, category, sub_category)
  results = google_results(query)

  results.each do |result|
    place_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{result['place_id']}&key=#{API_KEY}"
    place = HTTParty.get(place_url)
    place = JSON.parse(place.body)

    photo_references = get_photo_references(place)

    seed_database_google(result, photo_references, city, category, sub_category)
  end
end

def seed_database_openai(title, description, address, rating, city, category)
  image_urls = []
  3.times do
    image_urls << "https://source.unsplash.com/random/?#{category}&#{rand(1..1000)}"
  end

  suggestion = Suggestion.create!(
    title: title,
    overview: description,
    address: address,
    rating: rating,
    images: image_urls,
    city: city,
    category: Category.find_by(title: category)
  )
  puts "Created #{suggestion.title}"
end

def iterate_openai_ideas(category, city)
  puts ""
  puts "#{category} suggestions #{city}:"

  case city
  when "Amsterdam"
    date_ideas = $ideas_amsterdam[category]
  when "Rotterdam"
    date_ideas = $ideas_rotterdam[category]
  when "The Hague"
    date_ideas = $ideas_the_hague[category]
  end

  date_ideas.each do |idea|
    seed_database_openai(idea[:title], idea[:description], idea[:address], idea[:rating], city, category)
  end
end

puts "Cleaning database"
Favorite.destroy_all
Suggestion.destroy_all
Category.destroy_all

admin = User.create(
  first_name: "Admin",
  last_name: "Smit",
  email: "admin@email.com",
  password: "password"
)

puts "Created admin to login with: email #{admin.email}, password: 'password'}"

puts ""
puts "Creating categories"

categories = ['Dining', 'Drinks', 'Adventure & Active', 'Outdoor & Nature', 'Entertainment & Cultural', 'Relaxation & Wellness', 'Romantic', 'Unique']
icons = ['fa-solid fa-utensils', 'fa-solid fa-champagne-glasses', 'fa-solid fa-bicycle', 'fa-solid fa-tree', 'fa-solid fa-film', 'fa-solid fa-spa', 'fa-solid fa-heart', 'fa-regular fa-lightbulb']

categories.each_with_index do |name, index|
  category = Category.create!(title: name, icon: icons[index])
  puts "Created #{category.title}"
end

puts ""
cities = ["Amsterdam", "Rotterdam", "The Hague"]

cities.each do |city|
  puts "Creating suggestions for #{city}"

  categories.each do |category|
    case category
    when 'Drinks'
      sub_categories = ['Cafe', 'Coffee', 'Pubs', 'Cocktail', 'Wine']

      sub_categories.each do |sub_category|
        puts ""
        puts "#{sub_category} bars #{city}:"
        create_suggestions("#{sub_category}%20in%20#{city}", city, category, sub_category)
      end
    when 'Dining'
      sub_categories = ['Italian', 'French', 'Asian', 'American']

      sub_categories.each do |sub_category|
        puts ""
        puts "#{sub_category} restaurants #{city}:"
        create_suggestions("#{sub_category}%20restaurants%20in%20#{city}", city, category, sub_category)
      end
    else
      iterate_openai_ideas(category, city)
    end
  end
end

puts "Finished!"
