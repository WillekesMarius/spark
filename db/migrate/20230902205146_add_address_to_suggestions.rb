class AddAddressToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :address, :string
  end
end
