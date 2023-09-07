class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @suggestions = @category.suggestions

    if params[:filter].present?
      case params[:filter]
      when "Amsterdam" then @suggestions = @suggestions.where(city: "Amsterdam")
      when "Rotterdam" then @suggestions = @suggestions.where(city: "Rotterdam")
      when "TheHague" then @suggestions = @suggestions.where(city: "The Hague")
      end
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "suggestions/list", locals: {suggestions: @suggestions}, formats: [:html] }
      end
    end
  end
end
