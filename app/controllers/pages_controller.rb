class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  layout false, only: :home # Disable layout for the "home" action

  def index
  end

  def profile
    @user = current_user
  end

  def home
  end

end
