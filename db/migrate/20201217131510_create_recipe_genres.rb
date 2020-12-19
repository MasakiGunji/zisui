class CreateRecipeGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_genres do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
