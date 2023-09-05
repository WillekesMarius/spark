class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def create
    @user = current_user
    @suggestion = Suggestion.find(params[:suggestion_id])
    @favorite = Favorite.new
    @favorite.user = @user
    @favorite.suggestion = @suggestion
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end
end
