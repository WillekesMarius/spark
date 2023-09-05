class AddSwipesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :swipes, :integer, array: true, default: []
  end
end
