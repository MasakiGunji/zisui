Rails.application.routes.draw do

  root to:'homes#top'
  get 'my_page', to: 'users#my_page'
  resources :recipes
  resources :recipe_genres, except: [:show, :new]
  resources :food_genres, except: [:show, :new]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
