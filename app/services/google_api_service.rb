# class GoogleController < ApplicationController
#   def generate_suggestions(query, category)
#     api_key = ENV['GOOGLE_API_KEY']

#     api_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&key=#{api_key}"
#     data = HTTParty.get(api_url)
#     results = data["results"]

#     results.each do |result|
#       place_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{result["place_id"]}&key=#{api_key}"
#       place = HTTParty.get(place_url)
#       place = JSON.parse(place.body)

#       photo_references = []
#       photos = place["result"]["photos"]

#       if photos
#         photos.each do |photo|
#           photo_reference = photo["photo_reference"]
#           photo_references << "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_reference}&key=#{api_key}"
#         end
#       end

#       suggestion = Suggestion.create!(
#         title: result["name"],
#         overview: Faker::Restaurant.description,
#         longitude: result["geometry"]["location"]["lng"],
#         latitude: result["geometry"]["location"]["lat"],
#         category: Category.find_by(title: category),
#         image_url: "",
#         images: photo_references,
#         rating: result["rating"],
#         total_ratings: result["user_ratings_total"]
#       )
#       puts "Created #{suggestion.title}"
#     end
#   end
# end
