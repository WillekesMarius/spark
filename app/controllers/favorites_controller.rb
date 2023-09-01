class FavoritesController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def favorite
    @suggestion = Suggestion.find(params[:favorite_id])
    Favorite.create(user_id: current_user.id, suggestion_id: @suggestion.id)
    redirect_to suggestion_path(@suggestion)
  end
end
