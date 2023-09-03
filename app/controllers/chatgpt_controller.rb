class ChatgptController < ApplicationController
  def index
    # @response = ChatgptService.call("Give me 20 date ideas (category: Adventure & Active) in Amsterdam. Include title, description and rating. Return the entire response in a JSON format.")
    @response = ChatgptService.call("Give me 5 italian restaurants in Amsterdam-Oost (only the names). Return them in a csv format including only the headings.")
    @suggestions = response_to_array
  end

  private

  def response_to_array
    suggestions = []

    @response.each do |suggestion|
      suggestion[0].match(/\d/).nil? ? suggestions << suggestion : suggestions << suggestion[2..]
    end
    return suggestions
  end
end
