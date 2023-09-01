class AddRatingAndTotalRatingsToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :rating, :integer
    add_column :suggestions, :total_ratings, :integer
  end
end
