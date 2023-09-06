class FavoritesController < ApplicationController
  before_action :set_suggestion, only: [:create]

  def index
    @favorites = Favorite.all
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    redirect_to suggestion_path(@favorite.suggestion)
  end

  def create
    @user = current_user
    @favorite = Favorite.new
    @favorite.user = @user
    @favorite.suggestion = @suggestion

    
    if params[:referrer] == "show" && @favorite.save
      redirect_to suggestion_path(@suggestion)
    else
      if @favorite.save
        render json: @favorite, status: :created
      else
        render json: { errors: @favorite.errors.full_messages }, status: :unprocessable_entity
      end
    end

  #  redirect_to suggestion_path(@favorite.suggestion)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

  private

  def set_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end

  def favorite_params
    params.require(:favorite).permit(:occurs_on)
  end
end



