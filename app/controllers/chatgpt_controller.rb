class ChatgptController < ApplicationController
  def index
    @response = ChatgptService.call("Give me 5 italian restaurants in Amsterdam-Oost (only the names). Return them in a csv format including only the headings.")
    @suggestions = response_to_array

    # @response = ChatgptService.call("Give me 5 cocktail bars in De Pijp, Amsterdam (only the names). Return them in a csv format including only the headings.")
    # @response = ChatgptService.call("Give me 5 creative date ideas specifically in Amsterdam (only the names). Return them in a csv format including only the headings.")

    # @response2 = ChatgptService.call("Give me 5 italian restaurants in Amsterdam-Oost (only the names) that are all different from #{@response}. Return them in a csv format including only the headings.")
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
