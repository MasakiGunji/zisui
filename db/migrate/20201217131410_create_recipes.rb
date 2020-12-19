class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :recipe_genres_id
      t.string :image_id
      t.string :name
      t.string :body

      t.timestamps
    end
  end
end
