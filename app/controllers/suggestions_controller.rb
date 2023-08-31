class SuggestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @suggestions = Suggestion.all
  end

  def show
  end
end
