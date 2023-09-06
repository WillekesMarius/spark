class SuggestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @suggestions = Suggestion.all
    # @my_suggestion = Suggestion.first
    # loop do
    #   suggestion = suggestions_list.sample
    #   if current_user.swipes.include?(suggestion.id)
    #     next
    #   else
    #     @my_suggestion = suggestion
    #     break
    #   end
    # end
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    
    @favorite = @suggestion.favorites.where(user_id: current_user.id)
    @favorite.update(date_params)
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @favorite = Favorite.new
    @markers = [{
      lat: @suggestion.latitude,
      lng: @suggestion.longitude
    }]
  end

  # def favorite
  #   @suggestion = Suggestion.find(params[:id])
  #   @favorite = Favorite.create
  #   @favorite.user = current_user
  #   @favorite.suggestion = @suggestion
  #   redirect_to suggestion_path(@suggestion)
  # end

  # private

  # def favorite_params
  #   permit(:favorite).require(:user_id)
  # end

  private

  def suggestions_list
    if user_signed_in?
      current_user.preferences = ['Coffee', 'Italian']
      my_suggestions = []

      current_user.preferences.each do |preference|
        suggestions = Suggestion.where(sub_category: preference, city: 'Amsterdam')
        suggestions.each { |suggestion| my_suggestions << suggestion }
      end
    else
      my_suggestions = Suggestion.all
    end
    return my_suggestions
  end

  def date_params
    params.require(:favorite).permit(:occurs_on)
  end

end
