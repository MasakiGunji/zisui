class RecipeGenresController < ApplicationController
  def index
    @recipe_genres = RecipeGenre.where(user_id: current_user.id)
    @recipe_genre = RecipeGenre.new
  end

  def create
    @recipe_genre = RecipeGenre.new(recipe_genre_params)
    @recipe_genre.user_id = current_user.id
    @recipe_genre.save
    redirect_to recipe_genres_path
  end

  def edit
    @recipe_genre = RecipeGenre.joins(:recipes).find(params[:id])
  end

  def update
    @recipe_genre = RecipeGenre.find(params[:id])
    @recipe_genre.update(recipe_genre_params)
    redirect_to recipe_genres_path
  end

  def destroy
    @recipe_genre = RecipeGenre.find(params[:id])
    @recipe_genre.destroy
    redirect_to recipe_genres_path
  end
  
  private
  def recipe_genre_params
    params.require(:recipe_genre).permit(:name, :user_id)
  end
end
