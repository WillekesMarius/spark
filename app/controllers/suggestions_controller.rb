class SuggestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @suggestion = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  def favorite
    @suggestion = Suggestion.find(params[:id])
    @favorite = Favorite.create()
    @favorite.user = current_user
    @favorite.suggestion = @suggestion
    redirect_to suggestion_path(@suggestion)
  end

  private

  # def favorite_params
  #   permit(:favorite).require(:user_id)
  # end
end
