class ChangeRatingToBeFloatInSuggestions < ActiveRecord::Migration[7.0]
  def change
    change_column :suggestions, :rating, :float
  end
end
