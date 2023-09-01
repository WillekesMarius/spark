class AddSubCategoryToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :sub_category, :string
  end
end
