class Suggestion < ApplicationRecord
  

  belongs_to :category

  has_many :favorites
  has_many :users, through: :favorites

  has_many :reviews
  has_many :users, through: :reviews

  has_many :favorites 
  def favorited?(user)
      @favorites = self.favorites.where{|favorite|favorite.user_id == user.id}
      if @favorites == []
        return false  
      else
        return true
      end
  end

end
