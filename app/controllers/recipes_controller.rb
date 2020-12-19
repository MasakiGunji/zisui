class RecipesController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.new
    @recipe_genres = RecipeGenre.where(user_id: current_user.id)
  end
  
  def create
    if flag = "existing_recipe_genres"
      @recipe = Recipe.new(recipe_params)
      @recipe.user_id = current_user.id
      @recipe.recipe_genres_id = @recipe_genre.id
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      @recipe_genre = RecipeGenre.new
      @recipe_genre.name = params[:recipe_genre_name]
      @recipe_genre.user_id = current_user.id
      @recipe_genre.save
      @recipe = Recipe.new(recipe_params)
      @recipe.user_id = current_user.id
      @recipe.recipe_genres_id = @recipe_genre.id
      @recipe.save
    end
      redirect_to recipe_path(@recipe)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def recipe_params
    params.require(:recipe).permit(:name, :body, :image)
  end
  
end