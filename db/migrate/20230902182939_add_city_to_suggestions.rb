class AddCityToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :city, :string
  end
end
