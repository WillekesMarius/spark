class RemoveImageUrlFromSuggestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :suggestions, :image_url, :string
  end
end
