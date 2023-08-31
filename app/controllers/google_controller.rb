class GoogleController < ApplicationController
  require 'json'

  def index
    api_key = ENV['GOOGLE_API_KEY']
    api_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants%20in%20Amsterdam&key=#{api_key}"

    data = HTTParty.get(api_url)
    @results = data["results"]
  end
end
