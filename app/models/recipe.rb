class Recipe < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :recipe_genre
  attachment :image
end
