class AddImagesToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :images, :string, array: true, default: []
  end
end
