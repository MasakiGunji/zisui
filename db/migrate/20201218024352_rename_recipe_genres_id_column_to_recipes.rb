class RenameRecipeGenresIdColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :recipe_genres_id, :recipe_genre_id
  end
end
