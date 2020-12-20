class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
    @recipe_genres = RecipeGenre.where(user_id: current_user.id)
  end
  
  def create
    if params[:flag] == "existing_recipe_genres"
      @recipe = Recipe.new(recipe_params)
      @recipe.user_id = current_user.id
    else
      @recipe_genre = RecipeGenre.new
      @recipe_genre.name = params[:recipe_genre_name]
      @recipe_genre.user_id = current_user.id
      @recipe_genre.save
      @recipe = Recipe.new(recipe_params)
      @recipe.user_id = current_user.id
      @recipe.recipe_genre_id = @recipe_genre.id
    end
      @recipe.save
      redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_genres = RecipeGenre.where(user_id: current_user.id)
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
  
  
  private
  def recipe_params
    params.require(:recipe).permit(:name, :body, :image,:recipe_genre_id, :user_id)
  end
end
