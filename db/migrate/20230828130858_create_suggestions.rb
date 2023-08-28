class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.text :overview
      t.string :title
      t.float :longitude
      t.float :latitude
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
