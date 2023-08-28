class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :suggestion, null: false, foreign_key: true
      t.date :occurs_on

      t.timestamps
    end
  end
end
