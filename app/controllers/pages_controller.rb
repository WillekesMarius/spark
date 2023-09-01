class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
  end

  def profile
    @user = User.find(params[:id])
  end
end
