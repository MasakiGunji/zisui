class FoodGenresController < ApplicationController
  def index
    @food_genres = FoodGenre.where(user_id: current_user)
    @food_genre = FoodGenre.new
  end

  def create
    @food_genre = FoodGenre.new(food_genre_params)
    @food_genre.user_id = current_user.id
    @food_genre.save
    redirect_to food_genres_path
  end

  def edit
    @food_genre = FoodGenre.joins(:foods).find(params[:id])
  end

  def update
    @food_genre = FoodGenre.find(params[:id])
    @food_genre.update(food_genre_params)
    redirect_to food_genres_path
  end
  
  def destroy
    @food_genre = FoodGenre.find(params[:id])
    @food_genre.destroy
    redirect_to food_genres_path
  end
  
  private
  def recipe_genre_path
    params.require(:food_genre).permit(:name, :status, :user_id)
  end
end
